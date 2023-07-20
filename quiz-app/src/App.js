import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import FrontPage from './components/FrontPage';
import MainPage from './components/MainPage';
import Quiz from './components/Quiz';
import UserProfile from './components/UserProfile';

const App = () => {
  return (
    <Router>
      <div>
        <Routes>
          <Route path="/" element={<FrontPage />} />
          <Route path="/main" element={<MainPage />} />
          <Route path="/quiz" element={<Quiz />} />
          <Route path="/profile" element={<UserProfile />} />
        </Routes>
      </div>
    </Router>
  );
};

export default App;
