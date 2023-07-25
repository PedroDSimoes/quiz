import React, { useState } from 'react';
import { useDispatch } from 'react-redux';
import { loginUser } from '../actions';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import './FrontPage.css';

const FrontPage = () => {
  // Login state variables
  const [loginUsername, setLoginUsername] = useState('');
  const [loginPassword, setLoginPassword] = useState('');
  const [loginError, setLoginError] = useState('');

  // Registration state variables
  const [registrationUsername, setRegistrationUsername] = useState('');
  const [registrationEmail, setRegistrationEmail] = useState('');
  const [registrationPassword, setRegistrationPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [registrationError, setRegistrationError] = useState('');
  const [registrationSuccess, setRegistrationSuccess] = useState(false);

  const dispatch = useDispatch();
  const navigate = useNavigate();

  const handleRegister = () => {
    if (registrationPassword !== confirmPassword) {
      setRegistrationError('Passwords do not match.');
      return;
      
      
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(registrationEmail)) {
      setRegistrationError('Please enter a valid email address.');
      return;
    }

    axios
      .post('http://localhost:8001/register', {
        username: registrationUsername,
        email: registrationEmail,
        password: registrationPassword,
      })
      .then((response) => {
        console.log(response.data);
        setRegistrationSuccess(true);
        setRegistrationError('');
        // Dispatch an action to your Redux store for login, if needed
        // dispatch(loginUser(response.data));
      })
      .catch((error) => {
        console.error(error);
        if (error.response && error.response.data && error.response.data.errors) {
          setRegistrationError(error.response.data.errors[0].msg);
        } else {
          setRegistrationError('Registration failed. Please try again later.');
        }
        setRegistrationSuccess(false);
      });
  };

  const handleLogin = () => {
    axios
      .post('http://localhost:8001/login', {
        username: loginUsername,
        password: loginPassword,
      })
      .then((response) => {
        console.log(response.data);
        localStorage.setItem('user_id', response.data.user_id);
        navigate('/quiz/select');
        // Dispatch an action to your Redux store for login, if needed
        // dispatch(loginUser(response.data));
      })
      .catch((error) => {
        console.error(error);
        if (error.response && error.response.data && error.response.data.errors) {
          setLoginError(error.response.data.errors[0].msg);
        } else {
          setLoginError('Login failed. Please check your credentials and try again.');
        }
      });
  };

  return (
    <div>
      {/* Navbar */}
      <nav className="navbar">
        <div className="login-section">
          {loginError && <p style={{ color: 'red' }}>{loginError}</p>}
          <input
            type="text"
            placeholder="Username"
            value={loginUsername}
            onChange={(e) => setLoginUsername(e.target.value)}
          />
          <input
            type="password"
            placeholder="Password"
            value={loginPassword}
            onChange={(e) => setLoginPassword(e.target.value)}
          />
          <button onClick={handleLogin}>Login</button>
        </div>
        <a href="#about">About</a>
      </nav>
      {/* Header/Nav section */}
      <header className="app-header">
        <h1 className="app-title">InfoSphere</h1>
      </header>

      {/* Registration section */}
      <div className="registration-section">
        <h2>Register</h2>
        {registrationSuccess && <p style={{ color: 'green' }}>Registration successful! Please log in above.</p>}
        {registrationError && <p style={{ color: 'red' }}>{registrationError}</p>}
        <input
          type="text"
          placeholder="Username"
          value={registrationUsername}
          onChange={(e) => setRegistrationUsername(e.target.value)}
        />
        <input
          type="email"
          placeholder="Email"
          value={registrationEmail}
          onChange={(e) => setRegistrationEmail(e.target.value)}
        />
        <input
          type="password"
          placeholder="Password"
          value={registrationPassword}
          onChange={(e) => setRegistrationPassword(e.target.value)}
        />
        <input
          type="password"
          placeholder="Confirm Password"
          value={confirmPassword}
          onChange={(e) => setConfirmPassword(e.target.value)}
        />
        <button onClick={handleRegister}>Register</button>
      </div>

      {/* Mission/About section */}
      <div className="mission-section" id="about">
        <h2 className="section-title">Our Mission</h2>
        <p className="mission-text">
          Something something something
        </p>
        {/* ... Add more paragraphs of the mission or about section ... */}
      </div>
    </div>
  );
};

export default FrontPage;