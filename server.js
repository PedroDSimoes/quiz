const express = require('express');
const bodyParser = require('body-parser');
const { Pool } = require('pg'); 
const cors = require('cors');
const session = require('express-session');
const dotenv = require('dotenv');
const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;
const bcrypt = require('bcrypt');
const pgConfig = require('./pgconfig');
const helmet = require('helmet');
const { body, validationResult } = require('express-validator');

dotenv.config();

const app = express();
const port = 8001;

app.use(cors());

app.use(helmet());

const pool = new Pool(pgConfig);

app.use(bodyParser.json());

app.get('/', (req, res) => {
  res.send('Quiz App Server is running. Check for security issues in the frontend.');
});

pool.connect((err, client, done) => {
  if (err) {
    console.error('Error connecting to the database:', err);
  } else {
    client.query(
      'SELECT table_name FROM information_schema.tables WHERE table_schema = $1',
      ['public'],
      (error, results) => {
        done();
        if (error) {
          console.error('Error fetching table names:', error);
        } else {
          console.log('Connected to the database and the following tables are available:');
          results.rows.forEach(row => {
            console.log(row.table_name);
          });
        }
      }
    );
  }
});

app.use(
    session({
      secret: process.env.SESSION_SECRET,
      resave: false,
      saveUninitialized: false,
      cookie: {
        maxAge: 172800000, // Set the session expiration time to 2 days (2 * 24 * 60 * 60 * 1000 ms)
        secure: true, // Enforce HTTPS to use secure cookies
        sameSite: "none", // Allow cross-site access to the session cookie
        httpOnly: true, // Prevent client-side access to the cookie
      },
    })
  );

passport.use(
    new LocalStrategy((username, password, done) => {
      pool.query('SELECT * FROM users WHERE username = $1', [username], (error, result) => {
        if (error) {
          console.error('Error executing query:', error);
          return done(error);
        }
  
        if (result.rows.length === 0) {
          return done(null, false, { message: 'Invalid username or password.' });
        }
  
        const user = result.rows[0];
  
        // Compare the provided password with the hashed password from the database using bcrypt.compare
        bcrypt.compare(password, user.password, (err, isMatch) => {
          if (err) {
            console.error('Error comparing passwords:', err);
            return done(err);
          }
  
          if (isMatch) {
            // Passwords match, user authenticated
            return done(null, user);
          } else {
            // Passwords do not match
            return done(null, false, { message: 'Invalid username or password.' });
          }
        });
      });
    })
  );
  
  
  // Serialize and deserialize user (required for session support)
  passport.serializeUser((user, done) => {
    done(null, user.user_id); // Use user_id as the unique identifier for serialization
  });
  
  passport.deserializeUser((id, done) => {
    // Fetch the user from the database based on the user_id (stored in the session)
    pool.query('SELECT * FROM users WHERE user_id = $1', [id], (error, result) => {
      if (error) {
        console.error('Error executing query:', error);
        return done(error);
      }
  
      if (result.rows.length === 0) {
        return done(null, false, { message: 'User not found.' });
      }
  
      const user = result.rows[0];
      done(null, user);
    });
  });

  app.use(passport.initialize());
  app.use(passport.session());

  function ensureAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
      // If the user is authenticated, continue to the next middleware (or the route handler)
      return next();
    } else {
      // If the user is not authenticated, redirect them to the login page or send an error response
      res.status(401).json({ error: 'Unauthorized: You need to be logged in to access this resource.' });
    }
  }
  

  app.post(
    '/login',
    [
      body('username').notEmpty().withMessage('Username is required.'),
      body('password').notEmpty().withMessage('Password is required.'),
    ], passport.authenticate('local'),
    ensureAuthenticated, 
    (req, res) => {
      console.log(req.isAuthenticated())
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
      }
  
      const { username, password } = req.body;
  
      // Fetch the user from the database based on the provided username
      pool.query('SELECT * FROM users WHERE username = $1', [username], (error, result) => {
        if (error) {
          console.error('Error executing query:', error);
          return res.status(500).json({ error: 'Internal server error.' });
        }
  
        if (result.rows.length === 0) {
          return res.status(401).json({ error: 'Invalid username or password.' });
        }
  
        const user = result.rows[0];
  
        // Compare the provided password with the hashed password from the database using bcrypt.compare
        bcrypt.compare(password, user.password, (err, isMatch) => {
          if (err) {
            console.error('Error comparing passwords:', err);
            return res.status(500).json({ error: 'Internal server error.' });
          }
  
          if (isMatch) {
            // Passwords match, user authenticated
            // Store user data in the session
            req.session.user = {
              user_id: user.user_id,
              username: user.username,
              // Include any additional user data that you might need in the session
            };
  
            req.session.authenticated = true;
  
            return res.status(200).json({ message: 'Login successful.', user_id: user.user_id });
          } else {
            // Passwords do not match
            return res.status(401).json({ error: 'Invalid username or password.' });
          }
        });
      });
    }
  );

  app.get('/categories', (req, res) => {
    pool.query('SELECT * FROM categories', (error, results) => {
      if (error) {
        console.error('Error executing query:', error);
        return res.status(500).json({ error: 'Internal server error.' });
      }
      return res.status(200).json(results.rows);
    });
  });

app.get('/quiz/questions', async (req, res) => {
    const { category, difficulty } = req.query;
  
    try {
      // Fetch questions and their answers from the database based on the category and difficulty
      const query = `
        SELECT q.question_id, q.question_text, a.answer_id, a.answer_text, a.is_correct
        FROM questions q
        INNER JOIN answers a ON q.question_id = a.question_id
        INNER JOIN categories c ON q.category_id = c.category_id
        WHERE c.category_name = $1 AND q.difficulty_level = $2;
      `;
      const values = [category, difficulty];
      const result = await pool.query(query, values);
  
      // Format the data to group questions and their answers
      const questions = [];
      result.rows.forEach((row) => {
        const questionIndex = questions.findIndex((q) => q.question_id === row.question_id);
        if (questionIndex === -1) {
          // If question not found in the array, add it along with the first answer
          questions.push({
            question_id: row.question_id,
            question_text: row.question_text,
            answers: [
              { answer_id: row.answer_id, answer_text: row.answer_text, is_correct: row.is_correct },
            ],
          });
        } else {
          // If question found, add the answer to the existing question
          questions[questionIndex].answers.push({
            answer_id: row.answer_id,
            answer_text: row.answer_text,
            is_correct: row.is_correct,
          });
        }
      });
  
      return res.json({ questions });
    } catch (error) {
      console.error('Error fetching questions:', error);
      return res.status(500).json({ error: 'Internal server error.' });
    }
  });
  
  app.post('/register', [
    body('username').isString().isLength({ min: 5 }).withMessage('Username must be at least 5 characters.'),
    body('email').isEmail().normalizeEmail(),
    body('password').isLength({ min: 8 }).withMessage('Password must be at least 8 characters.')
      .matches(/\d/).withMessage('Password must contain at least one numeric digit.'),
  ], (req, res) => {
    // Check for validation errors
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
  
    const { username, email, password } = req.body;
  
    // Check if the username already exists in the database
    pool.query('SELECT * FROM users WHERE username = $1', [username], (error, result) => {
      if (error) {
        console.error('Error executing query:', error);
        return res.status(500).json({ error: 'Internal server error.' });
      }
  
      if (result.rows.length > 0) {
        return res.status(409).json({ error: 'Username already exists.' });
      }
  
      // Hash and salt the password before inserting the new user into the database
      bcrypt.hash(password, 10, (err, hash) => {
        if (err) {
          console.error('Error hashing password:', err);
          return res.status(500).json({ error: 'Internal server error.' });
        }
  
        // Insert the new user into the database with the hashed password
        pool.query(
          'INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING user_id',
          [username, email, hash], // Use the hash instead of the plain-text password
          (err, result) => {
            if (err) {
              console.error('Error executing query:', err);
              return res.status(500).json({ error: 'Internal server error.' });
            }
  
            const user_id = result.rows[0].user_id;
            return res.status(201).json({ message: 'Registration successful.', user_id });
          }
        );
      });
    });
  });

  app.get('/logout', (req, res) => {
    // Perform any other operations related to logout if needed
  
    // Logout the user using req.logout with a callback function
    req.logout((err) => {
      if (err) {
        console.error('Error during logout:', err);
        return res.status(500).json({ error: 'Internal server error.' });
      }
  
      // Logout successful, redirect the user to the homepage
      res.redirect("/");
    });
  });

app.listen(port, () => {
  console.log(`Server listening on http://localhost:${port}`);
});