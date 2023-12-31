import React, { useState, useEffect } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import axios from 'axios';
 // Import the quiz.css file from the same folder
import './Quiz.css';

const QuizPage = () => {
  const location = useLocation();
  const [questions, setQuestions] = useState([]);
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);
  const [userSelectedAnswer, setUserSelectedAnswer] = useState(null);
  const [timer, setTimer] = useState(15);
  const [hasMovedToNextQuestion, setHasMovedToNextQuestion] = useState(false);
  const [correctAnswers, setCorrectAnswers] = useState(0);
  const [incorrectAnswers, setIncorrectAnswers] = useState(0);
  const [unansweredQuestions, setUnansweredQuestions] = useState(0);
  const navigate = useNavigate();

  useEffect(() => {
    // Check if there is a user_id in localStorage
    const user_id = localStorage.getItem('user_id');
    if (!user_id) {
      // If no user_id is found, navigate back to the login page or display an error message
      // You can modify this to redirect the user to your desired route for login
      // For example: navigate('/login');
      alert('You need to log in to access this quiz.');
      window.location.replace('http://localhost:3000'); 
    } else {
      // If there is a user_id, proceed with fetching questions
      const searchParams = new URLSearchParams(location.search);
      const category = searchParams.get('category');
      const difficulty = searchParams.get('difficulty');

      fetchQuestions(category, difficulty);
    }
  }, [location]);

  useEffect(() => {
    let countdownInterval;

    // Start the countdown timer when a new question is displayed
    if (currentQuestionIndex < questions.length && !hasMovedToNextQuestion) {
      setTimer(30);
      countdownInterval = setInterval(() => {
        setTimer((prevTimer) => {
          if (prevTimer > 0) {
            return prevTimer - 1;
          } else {
            clearInterval(countdownInterval);
            handleNextQuestion(false); // Move to the next question with an unanswered flag
            return 30; // Reset timer to 15 when it reaches 0 and move to the next question
          }
        });
      }, 1000);
    }

    // Clean up the interval when the component is unmounted or the question changes
    return () => clearInterval(countdownInterval);
  }, [currentQuestionIndex, questions, hasMovedToNextQuestion]);

  const fetchQuestions = async (category, difficulty) => {
    try {
      const response = await axios.get(
        `http://localhost:8001/quiz/questions?category=${category}&difficulty=${difficulty}`
      );
      const questionsData = response.data.questions;
  
      // Shuffle the questions array using Fisher-Yates shuffle algorithm
      const shuffledQuestions = shuffleArray(questionsData);
  
      // Shuffle the answers for each question
      const shuffledQuestionsWithShuffledAnswers = shuffledQuestions.map((question) => ({
        ...question,
        answers: shuffleArray(question.answers),
      }));
  
      // Slice the array to get only the first 10 questions
      const limitedQuestions = shuffledQuestionsWithShuffledAnswers.slice(0, 10);
  
      setQuestions(limitedQuestions);
    } catch (error) {
      console.error('Error fetching questions:', error);
      // Handle error
    }
  };
  // Function to perform the Fisher-Yates shuffle on an array
  const shuffleArray = (array) => {
    const shuffledArray = [...array];
    for (let i = shuffledArray.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffledArray[i], shuffledArray[j]] = [shuffledArray[j], shuffledArray[i]];
    }
    return shuffledArray;
  };

  const handleAnswerSelection = (answerId) => {
    setUserSelectedAnswer(answerId);
    setHasMovedToNextQuestion(true); // Stop the timer and disable the options
  };

  const handleNextQuestion = (isAnswered = true) => {
    setHasMovedToNextQuestion(false); // Reset the flag to allow the timer for the next question
  
    // Update the correct, incorrect, and unanswered questions count based on user's answer
    if (isAnswered) {
      const currentQuestion = questions[currentQuestionIndex];
      const isAnswerCorrect =
        userSelectedAnswer !== null &&
        currentQuestion.answers.find((answer) => answer.is_correct)?.answer_id === userSelectedAnswer;
  
      if (isAnswerCorrect) {
        setCorrectAnswers((prevCorrect) => prevCorrect + 1);
      } else {
        setIncorrectAnswers((prevIncorrect) => prevIncorrect + 1);
      }
    } else {
      setUnansweredQuestions((prevUnanswered) => prevUnanswered + 1);
    }
  
    if (currentQuestionIndex === 9) {
      // If it's the 10th question, end the quiz here
      setCurrentQuestionIndex(10); // Set the current index to a value greater than the number of questions
    } else {
      setCurrentQuestionIndex((prevIndex) => prevIndex + 1);
    }
  
    setUserSelectedAnswer(null); // Reset user's answer when moving to the next question
  };

  // Calculate the user's score percentage
  const totalQuestions = questions.length;
  const answeredQuestions = correctAnswers + incorrectAnswers;
  const scorePercentage = (correctAnswers / answeredQuestions) * 100 || 0;

  // Render the current question and the timer
  const currentQuestion = questions[currentQuestionIndex];

  const isAnswerCorrect =
    userSelectedAnswer !== null &&
    currentQuestion.answers.find((answer) => answer.is_correct)?.answer_id === userSelectedAnswer;

    useEffect(() => {
      // When all questions have been answered, automatically submit the quiz result
      if (currentQuestionIndex === questions.length && currentQuestionIndex !== 0) {
        submitQuizResult();
      }
    }, [currentQuestionIndex, questions])
    
    const submitQuizResult = async () => {
      const user_id = JSON.parse(localStorage.getItem('user_id')); // Parse the user_id from localStorage
      const score = (correctAnswers / totalQuestions) * 100; // Calculate the score percentage
    
      // Get the category name and difficulty from the URL query parameters
      const searchParams = new URLSearchParams(location.search);
      const category_name = searchParams.get('category');
      const difficulty_level = searchParams.get('difficulty');
    
      try {
        await axios.post('http://localhost:8001/quiz/submit', {
          user_id,
          category_name,
          difficulty_level,
          score,
        });
    
        // Handle success, e.g., display a success message or navigate to a new page
      } catch (error) {
        console.error('Error submitting quiz result:', error);
        // Handle error, e.g., display an error message
        alert('Error submitting quiz result. Please try again later.');
      }
    };
    
    const handlePracticeAgainClick = () => {
      // Redirect to the desired URL
      window.location.href = 'http://localhost:3000/quiz/select';
      // You can also use react-router-dom if you're using React Router for navigation.
    };


    return (
      <div className="quiz-container">
      {currentQuestion && (
        <>
          <div className="quiz-question">
            <p>{currentQuestion.question_text}</p>
            <ul className="quiz-options">
              {currentQuestion.answers.map((answer) => (
                <li key={answer.answer_id}>
                  <label>
                    <input
                      type="radio"
                      name="answer"
                      value={answer.answer_id}
                      onChange={() => handleAnswerSelection(answer.answer_id)}
                      disabled={userSelectedAnswer !== null || hasMovedToNextQuestion}
                    />
                    {answer.answer_text}
                  </label>
                </li>
              ))}
            </ul>
            {userSelectedAnswer !== null && (
              <div className="quiz-feedback">
                {isAnswerCorrect ? (
                    <p className="quiz-feedback correct">Correct!</p>
                  ) : (
                    <p className="quiz-feedback incorrect">Incorrect!</p>
                  )}
                <p className="explanation-text">Correct answer: {currentQuestion.answers.find((answer) => answer.is_correct).answer_text}</p>
                <p style={{ fontSize: '14px' }}>{currentQuestion.explanation}</p>
              </div>
            )}
          </div>
          {userSelectedAnswer !== null || hasMovedToNextQuestion ? (
            <button className="quiz-next-button" onClick={() => handleNextQuestion(userSelectedAnswer !== null)}>
              Next Question
            </button>
          ) : (
            <p className="quiz-timer">Time remaining: {timer} seconds</p>
          )}
        </>
      )}
    
      {/* Display the score at the end of the quiz */}
      {!currentQuestion && (
        <div className="quiz-end-container">
          <p>Congratulations! You've completed the quiz.</p>
          <p>Your Score: {scorePercentage.toFixed(2)}%</p>
          <p>Correct Answers: {correctAnswers}</p>
          <p>Incorrect Answers: {incorrectAnswers}</p>
          <p>Unanswered Questions: {unansweredQuestions}</p>
          <button className="quiz-practice-again-button" onClick={handlePracticeAgainClick}>
            Practice again
          </button>
        </div>
      )}
    </div>
    );
  };

export default QuizPage;
