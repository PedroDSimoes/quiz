import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const QuizSelectionPage = () => {
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
    </div>
  );
};

export default QuizSelectionPage;