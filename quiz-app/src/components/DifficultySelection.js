import React from 'react';
import { Link } from 'react-router-dom';

const DifficultySelection = ({ category }) => {
  return (
    <div>
      <h1>Select Difficulty for {category}</h1>
      <Link to={`/quiz?category=${category}&difficulty=easy`}>Easy</Link>
      <Link to={`/quiz?category=${category}&difficulty=medium`}>Medium</Link>
      <Link to={`/quiz?category=${category}&difficulty=hard`}>Hard</Link>
    </div>
  );
};

export default DifficultySelection;