import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';

const QuizSelectionPage = () => {
  const [loggedIn, setLoggedIn] = useState(true); // Set this state based on the user's login status
  const navigate = useNavigate();

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

  return (
    <div>
      <h1>Select a Category</h1>
      {/* History */}
      <Link to="/quiz?category=History&difficulty=easy">History - Easy</Link>
      <Link to="/quiz?category=History&difficulty=medium">History - Medium</Link>
      <Link to="/quiz?category=History&difficulty=hard">History - Hard</Link>

      {/* General Knowledge */}
      <Link to="/quiz?category=General Knowledge&difficulty=easy">General Knowledge - Easy</Link>
      <Link to="/quiz?category=General Knowledge&difficulty=medium">General Knowledge - Medium</Link>
      <Link to="/quiz?category=General Knowledge&difficulty=hard">General Knowledge - Hard</Link>

      {/* Geography */}
      <Link to="/quiz?category=Geography&difficulty=easy">Geography - Easy</Link>
      <Link to="/quiz?category=Geography&difficulty=medium">Geography - Medium</Link>
      <Link to="/quiz?category=Geography&difficulty=hard">Geography - Hard</Link>

      {/* Music */}
      <Link to="/quiz?category=Music&difficulty=easy">Music - Easy</Link>
      <Link to="/quiz?category=Music&difficulty=medium">Music - Medium</Link>
      <Link to="/quiz?category=Music&difficulty=hard">Music - Hard</Link>

      {loggedIn ? (
        <button onClick={handleLogout}>Logout</button>
      ) : (
        <Link to="/login">Login</Link>
      )}
    </div>
  );
};

export default QuizSelectionPage;