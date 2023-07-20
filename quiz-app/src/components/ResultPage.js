import React from 'react';

const ResultsPage = (props) => {
  const { score, questions } = props.location.state;

  return (
    <div>
      <h2>Quiz Results</h2>
      <p>Your score: {score}%</p>
      <h3>Answers:</h3>
      {questions.map((question) => (
        <div key={question.question_id}>
          <p>{question.question_text}</p>
          <p>Correct answer: {question.answers.find((answer) => answer.is_correct).answer_text}</p>
        </div>
      ))}
    </div>
  );
};

export default ResultsPage;