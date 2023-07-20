import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import axios from 'axios';

const QuizPage = () => {
  const location = useLocation();
  const [questions, setQuestions] = useState([]);
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);
  const [userSelectedAnswer, setUserSelectedAnswer] = useState(null);
  const [timer, setTimer] = useState(15);

  useEffect(() => {
    // Get the category and difficulty from the URL parameters
    const searchParams = new URLSearchParams(location.search);
    const category = searchParams.get('category');
    const difficulty = searchParams.get('difficulty');

    // Fetch the questions based on the category and difficulty
    fetchQuestions(category, difficulty);
  }, [location]);

  useEffect(() => {
    let countdownInterval;

    // Start the countdown timer when a new question is displayed
    if (currentQuestionIndex < questions.length) {
      setTimer(15);
      countdownInterval = setInterval(() => {
        setTimer((prevTimer) => {
          if (prevTimer > 0) {
            return prevTimer - 1;
          } else {
            clearInterval(countdownInterval);
            setCurrentQuestionIndex((prevIndex) => prevIndex + 1);
            setUserSelectedAnswer(null); // Reset user's answer when moving to the next question
            return 15; // Reset timer to 15 when it reaches 0 and move to the next question
          }
        });
      }, 1000);
    }

    // Clean up the interval when the component is unmounted or the question changes
    return () => clearInterval(countdownInterval);
  }, [currentQuestionIndex, questions]);

  const fetchQuestions = async (category, difficulty) => {
    try {
      const response = await axios.get(
        `http://localhost:8001/quiz/questions?category=${category}&difficulty=${difficulty}`
      );
      const questionsData = response.data.questions;
      setQuestions(questionsData);
    } catch (error) {
      console.error('Error fetching questions:', error);
      // Handle error
    }
  };

  const handleAnswerSelection = (answerId) => {
    setUserSelectedAnswer(answerId);
  };

  // Render the current question and the timer
  const currentQuestion = questions[currentQuestionIndex];

  const isAnswerCorrect =
    userSelectedAnswer !== null &&
    currentQuestion.answers.find((answer) => answer.is_correct)?.answer_id === userSelectedAnswer;

  return (
    <div>
      {currentQuestion && (
        <>
          <div>
            <p>{currentQuestion.question_text}</p>
            <ul>
              {currentQuestion.answers.map((answer) => (
                <li key={answer.answer_id}>
                  <label>
                    <input
                      type="radio"
                      name="answer"
                      value={answer.answer_id}
                      onChange={() => handleAnswerSelection(answer.answer_id)}
                      disabled={userSelectedAnswer !== null}
                    />
                    {answer.answer_text}
                  </label>
                </li>
              ))}
            </ul>
            {userSelectedAnswer !== null && (
              <div>
                {isAnswerCorrect ? <p>Correct!</p> : <p>Incorrect!</p>}
                <p>Correct answer: {currentQuestion.answers.find((answer) => answer.is_correct).answer_text}</p>
              </div>
            )}
          </div>
          <p>Time remaining: {timer} seconds</p>
        </>
      )}
    </div>
  );
};

export default QuizPage;