import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';

const capitalizeFirstLetter = (string) => {
  return string.charAt(0).toUpperCase() + string.slice(1);
};

const QuizSelectionPage = () => {
  const [loggedIn, setLoggedIn] = useState(true); // Set this state based on the user's login status
  const navigate = useNavigate();
  const [averageScores, setAverageScores] = useState({}); 

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
  

  return (
    <div>
      <h1>Select a Category</h1>
      {/* History */}
      <Link to="/quiz?category=History&difficulty=easy">History - Easy</Link>
      <Link to="/quiz?category=History&difficulty=medium">History - Medium</Link>
      <Link to="/quiz?category=History&difficulty=hard">History - Hard</Link>

      {/* Science */}
      <Link to="/quiz?category=Science&difficulty=easy">Science - Easy</Link>
      <Link to="/quiz?category=Science&difficulty=medium">Science - Medium</Link>
      <Link to="/quiz?category=Science&difficulty=hard">Science - Hard</Link>

      {/* Geography */}
      <Link to="/quiz?category=Geography&difficulty=easy">Geography - Easy</Link>
      <Link to="/quiz?category=Geography&difficulty=medium">Geography - Medium</Link>
      <Link to="/quiz?category=Geography&difficulty=hard">Geography - Hard</Link>

      {/* Music */}
      <Link to="/quiz?category=Music&difficulty=easy">Music - Easy</Link>
      <Link to="/quiz?category=Music&difficulty=medium">Music - Medium</Link>
      <Link to="/quiz?category=Music&difficulty=hard">Music - Hard</Link>
      <div>
    {/* ... */}
    <h2>Average Scores</h2>
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