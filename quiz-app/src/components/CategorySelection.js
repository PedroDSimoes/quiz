import React from 'react';
import { Link } from 'react-router-dom';

const CategorySelection = () => {
  return (
    <div>
      <h1>Select a Category</h1>
      <Link to="/quiz?category=History">History</Link>
      <Link to="/quiz?category=Geography">Geography</Link>
      <Link to="/quiz?category=Music">Music</Link>
      <Link to="/quiz?category=General Knowledge">General Knowledge</Link>
    </div>
  );
};

export default CategorySelection;