import React from 'react';
import { Link } from 'react-router-dom';


const MainPage = () => {
  // Replace 'username' with the actual username from Redux store or API response
  const username = 'John Doe';

  return (
    <div>
      <h1>Welcome, {username}!</h1>
      <p>Select a quiz category:</p>
      <div>
      <Link to="/quiz/select">
        <button>History</button>
      </Link>
      <Link to="/quiz/select">
        <button>Geography</button>
      </Link>
      </div>
    </div>
  );
};

export default MainPage;