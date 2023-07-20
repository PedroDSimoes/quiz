import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const QuizSelectionPage = () => {
  const [loggedIn, setLoggedIn] = useState(true); // Set this state based on the user's login status

  const handleLogout = () => {
    // Make a request to the logout endpoint on the server (using the full URL)
    axios.get('http://localhost:8001/logout')
      .then((response) => {
        // Logout successful, update the state or do any additional actions
        setLoggedIn(false);

        // Redirect the user to the homepage after successful logout
        window.location.href = '/'; // Replace this with the URL of your homepage
      })
      .catch((error) => {
        // Handle any error that might occur during logout
        console.error('Error logging out:', error);
      });
  };

  const handleDifficultySelection = (category, difficulty) => {
    // Navigate to the QuizPage with selected category and difficulty as URL parameters
    window.location.href = `/quiz?category=${encodeURIComponent(category)}&difficulty=${encodeURIComponent(difficulty)}`;
  };

  return (
    <div>
      <h1>Select a Category</h1>
      <Link to="/quiz?category=History&difficulty=easy">History - Easy</Link>
      <Link to="/quiz?category=History&difficulty=medium">History - Medium</Link>
      <Link to="/quiz?category=Geography&difficulty=easy">Geography - Easy</Link>
      <Link to="/quiz?category=Geography&difficulty=medium">Geography - Medium</Link>

      {loggedIn ? (
        <button onClick={handleLogout}>Logout</button>
      ) : (
        <Link to="/login">Login</Link>
      )}
    </div>
  );
};

export default QuizSelectionPage;