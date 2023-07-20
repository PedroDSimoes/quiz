import React, { useState } from 'react';
import { useDispatch } from 'react-redux';
import { loginUser } from '../actions';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';


const FrontPage = () => {
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const dispatch = useDispatch();
  const navigate = useNavigate();

  const handleRegister = () => {
    // Make a POST request to the backend API for user registration
    axios
      .post('http://localhost:8001/register', { username, email, password })
      .then((response) => {
        console.log(response.data);
        // Dispatch an action to your Redux store for login, if needed
        // dispatch(loginUser(response.data));
      })
      .catch((error) => {
        console.error(error);
        // Handle registration error
      });
  };

  const handleLogin = () => {
    // Make a POST request to the backend API for user login
    axios
      .post('http://localhost:8001/login', { username, password })
      .then((response) => {
        console.log(response.data);
        navigate('/main');
        // Dispatch an action to your Redux store for login, if needed
        // dispatch(loginUser(response.data));
      })
      .catch((error) => {
        console.error(error);
        // Handle login error
      });
  };

  return (
    <div>
      <h1>Welcome to the Quiz App!</h1>
      <div>
        <h2>Register</h2>
        <input
          type="text"
          placeholder="Username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />
        <input
          type="email"
          placeholder="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
        <input
          type="password"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <button onClick={handleRegister}>Register</button>
      </div>

      <div>
        <h2>Login</h2>
        <input
          type="text"
          placeholder="Username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />
        <input
          type="password"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <button onClick={handleLogin}>Login</button>
      </div>
    </div>
  );
};

export default FrontPage;