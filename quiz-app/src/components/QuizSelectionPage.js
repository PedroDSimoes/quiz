import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';
import './QuizSelectionPage.css';

const capitalizeFirstLetter = (string) => {
  return string.charAt(0).toUpperCase() + string.slice(1);
};

const QuizSelectionPage = () => {
  const [loggedIn, setLoggedIn] = useState(true); // Set this state based on the user's login status
  const navigate = useNavigate();
  const [averageScores, setAverageScores] = useState({}); 
  const [username, setUsername] = useState('');


  const handleLogout = () => {
    // Make a request to the logout endpoint on the server (using the full URL)
    axios.get('http://localhost:8001/logout')
      .then((response) => {
        // Logout successful, update the state or do any additional actions
        setLoggedIn(false);
  
        // Remove the user_id from localStorage upon successful logout
        localStorage.removeItem('user_id');
  
        // Redirect the user to the homepage after successful logout
        window.location.replace('http://localhost:3000');  // Use navigate() for proper redirection
      })
      .catch((error) => {
        // Handle any error that might occur during logout
        console.error('Error logging out:', error);
      });
  };

  // Check if there is a user_id in localStorage
  const user_id = localStorage.getItem('user_id');
  if (!user_id) {
    // If no user_id is found, redirect to the login page (assuming it's on '/')
    // You can modify this to redirect the user to your desired route for login
    // For example: navigate('/login');
    alert('You need to log in to access the quiz selection page.');
    window.location.replace('http://localhost:3000'); ;
  }
  useEffect(() => {
    fetchUsername();
    fetchQuizResults();
  }, []);

  const fetchQuizResults = async () => {
    const user_id = JSON.parse(localStorage.getItem('user_id')); // Parse the user_id from localStorage
  
    try {
      const response = await axios.get(`http://localhost:8001/quiz/results/${user_id}`);
      const quizResults = response.data.results;
  
      if (quizResults.length === 0) {
        console.log("No quiz results available for the user.");
        // Handle the case when there are no quiz results available for the user
        return;
      }
  
      // Calculate average score per category and difficulty level
      const scoreSumByCategoryAndDifficulty = {};
      const quizCountsByCategoryAndDifficulty = {};
  
      quizResults.forEach((result) => {
        const { category_name, difficulty_level, score } = result;
        const key = `${category_name}_${difficulty_level}`;
  
        if (!isNaN(parseFloat(score))) {
          const scoreAsNumber = parseFloat(score);
          if (scoreSumByCategoryAndDifficulty[key] === undefined) {
            scoreSumByCategoryAndDifficulty[key] = scoreAsNumber;
            quizCountsByCategoryAndDifficulty[key] = 1;
          } else {
            scoreSumByCategoryAndDifficulty[key] += scoreAsNumber;
            quizCountsByCategoryAndDifficulty[key] += 1;
          }
        }
      });
  
      const averageScoresObj = {};
      Object.keys(scoreSumByCategoryAndDifficulty).forEach((key) => {
        const quizCount = quizCountsByCategoryAndDifficulty[key];
        const averageScore = scoreSumByCategoryAndDifficulty[key] / quizCount;
        averageScoresObj[key] = averageScore;
      });
  
      // Update the state with the calculated average scores
      setAverageScores(averageScoresObj);
  
      // Now you have the average scores per category and difficulty level
      console.log("Average Scores:", averageScores);
    } catch (error) {
      console.error('Error fetching quiz results:', error);
      // Handle error, e.g., display an error message
      alert('Error fetching quiz results. Please try again later.');
    }
  };
  
  const fetchUsername = async () => {
    const user_id = localStorage.getItem('user_id');

    try {
      const response = await axios.get(`http://localhost:8001/user/${user_id}`);
      const { username } = response.data; // Assuming the server returns the username in the response
      setUsername(username);
    } catch (error) {
      console.error('Error fetching username:', error);
      // Handle error, e.g., display an error message
      alert('Error fetching username. Please try again later.');
    }
  };


  return (
    <div>
      <div>
        <h1 className="greeting">Hello, {username}!</h1>
      </div>
      <button onClick={handleLogout} className="logout-button">Logout</button>
<div className="category-section">

  <div className="category-card category-science">
    <h2>Science</h2>
    <button onClick={() => window.location.replace('/quiz?category=Science&difficulty=easy')}>
      Easy
    </button>
    <button onClick={() => window.location.replace('/quiz?category=Science&difficulty=medium')}>
      Medium
    </button>
    <button onClick={() => window.location.replace('/quiz?category=Science&difficulty=hard')}>
      Hard
    </button>
  </div>
  <div className="category-card category-geography">
    <h2>Geography</h2>
    <button onClick={() => window.location.replace('/quiz?category=Geography&difficulty=easy')}>
      Easy
    </button>
    <button onClick={() => window.location.replace('/quiz?category=Geography&difficulty=medium')}>
      Medium
    </button>
    <button onClick={() => window.location.replace('/quiz?category=Geography&difficulty=hard')}>
      Hard
    </button>
  </div>

  <div className="category-card category-music">
    <h2>Music</h2>
    <button onClick={() => window.location.replace('/quiz?category=Music&difficulty=easy')}>
      Easy
    </button>
    <button onClick={() => window.location.replace('/quiz?category=Music&difficulty=medium')}>
      Medium
    </button>
    <button onClick={() => window.location.replace('/quiz?category=Music&difficulty=hard')}>
      Hard
    </button>
  </div>
  <div className="category-card category-history">
  <h2>History</h2>
  <button onClick={() => window.location.replace('/quiz?category=History&difficulty=easy')}>
       Easy
      </button>
      <button onClick={() => window.location.replace('/quiz?category=History&difficulty=medium')}>
        Medium
      </button>
      <button onClick={() => window.location.replace('/quiz?category=History&difficulty=hard')}>
        Hard
      </button>
  </div>
</div>
      <div className="average-scores-section">
    {/* ... */}
    <h2>Your Current Performance:</h2>
    {Object.entries(averageScores).map(([categoryDifficulty, score]) => {
      const [category, difficulty] = categoryDifficulty.split('_');
      const formattedScore = score.toFixed(2);
      return (
        <p key={categoryDifficulty}>
          Your current score in {category}, {capitalizeFirstLetter(difficulty)} difficulty is {formattedScore}%
        </p>
      );
    })}
    {/* ... */}
  </div>
    </div>
  );
};

export default QuizSelectionPage;