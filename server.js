const express = require('express');
const bodyParser = require('body-parser');
const { Pool } = require('pg'); 

const app = express();
const port = 8001;

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
  
      // User authenticated, you can generate a JWT token here if needed
  
      return res.status(200).json({ message: 'Login successful.', user_id: user.user_id });
    });
  });

app.listen(port, () => {
  console.log(`Server listening on http://localhost:${port}`);
});