const express = require('express');
const bodyParser = require('body-parser');
const { Pool } = require('pg'); 
const cors = require('cors');
const session = require('express-session');
const dotenv = require('dotenv');

dotenv.config();

const app = express();
const port = 8001;

app.use(cors());

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'quiz',
    password: 'none',
    port: 5432, // Change this to your PostgreSQL port if necessary
  });

app.use(bodyParser.json());

app.get('/', (req, res) => {
  res.send('Quiz App Server is running. Check for security issues in the frontend.');
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
      },
    })
  );

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

  app.get('/categories', (req, res) => {
    pool.query('SELECT * FROM categories', (error, results) => {
      if (error) {
        console.error('Error executing query:', error);
        return res.status(500).json({ error: 'Internal server error.' });
      }
      return res.status(200).json(results.rows);
    });
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
  
  app.post('/register', (req, res) => {
    const { username, email, password } = req.body;
  
    // Check if any of the required fields are missing
    if (!username || !email || !password) {
      return res.status(400).json({ error: 'Username, email, and password are required.' });
    }
  
    // Check if the username already exists in the database
    pool.query('SELECT * FROM users WHERE username = $1', [username], (error, result) => {
      if (error) {
        console.error('Error executing query:', error);
        return res.status(500).json({ error: 'Internal server error.' });
      }
  
      if (result.rows.length > 0) {
        return res.status(409).json({ error: 'Username already exists.' });
      }
  
      // Insert the new user into the database
      pool.query(
        'INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING user_id',
        [username, email, password],
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
  
app.post('/login', (req, res) => {
  const { username, password } = req.body;

  // Check if any of the required fields are missing
  if (!username || !password) {
    return res.status(400).json({ error: 'Username and password are required.' });
  }

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

    // Check if the provided password matches the one stored in the database
    if (user.password !== password) {
      return res.status(401).json({ error: 'Invalid username or password.' });
    }

    // User authenticated, store user data in the session
    req.session.user = {
      user_id: user.user_id,
      username: user.username,
      // Include any additional user data that you might need in the session
    };

    req.session.authenticated = true;

    return res.status(200).json({ message: 'Login successful.', user_id: user.user_id });
  });
});

  app.get('/quiz/questions', (req, res) => {
    const { category, difficulty } = req.query;
  
    // Fetch questions and answers from the database based on the category and difficulty
    // You'll need to use your database connection and perform the necessary queries here
    // For simplicity, I'll assume you have a function to fetch questions from the database
    const questions = fetchQuestionsFromDatabase(category, difficulty);
  
    // Return the questions and answers as a response
    return res.json({ questions });
  });

app.listen(port, () => {
  console.log(`Server listening on http://localhost:${port}`);
});