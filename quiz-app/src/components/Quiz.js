import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import axios from 'axios';

const QuizPage = () => {
  const location = useLocation();
  const [questions, setQuestions] = useState([]);

  useEffect(() => {
    // Get the category and difficulty from the URL parameters
    const searchParams = new URLSearchParams(location.search);
    const category = searchParams.get('category');
    const difficulty = searchParams.get('difficulty');

    // Fetch the questions based on the category and difficulty
    fetchQuestions(category, difficulty);
  }, [location]);

  const fetchQuestions = async (category, difficulty) => {
    try {
      const response = await axios.get(`http://localhost:8001/quiz/questions?category=${category}&difficulty=${difficulty}`);
      const questionsData = response.data.questions;
      setQuestions(questionsData);
    } catch (error) {
      console.error('Error fetching questions:', error);
      // Handle error
    }
  };

  return (
    <div>
      {/* Render the questions and answers */}
      {questions.map((question) => (
        <div key={question.question_id}>
          <p>{question.question_text}</p>
          <ul>
            {question.answers.map((answer) => (
              <li key={answer.answer_id}>
                {answer.answer_text} {answer.is_correct ? '(Correct)' : ''}
              </li>
            ))}
          </ul>
        </div>
      ))}
    </div>
  );
};

export default QuizPage;