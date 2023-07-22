import React, { useState } from 'react';
import { useDispatch } from 'react-redux';
import { loginUser } from '../actions';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

const FrontPage = () => {
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [registrationError, setRegistrationError] = useState('');
  const [registrationSuccess, setRegistrationSuccess] = useState(false);
  const [loginError, setLoginError] = useState('');

  const dispatch = useDispatch();
  const navigate = useNavigate();

  const handleRegister = () => {
    if (password !== confirmPassword) {
      setRegistrationError('Passwords do not match.');
      return;
    }

    axios
      .post('http://localhost:8001/register', { username, email, password })
      .then((response) => {
        console.log(response.data);
        setRegistrationSuccess(true); // Set the registration success message state
        setRegistrationError(''); // Clear any previous registration errors
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
        setRegistrationSuccess(false); // Registration failed, reset the registration success message
      });
  };

  const handleLogin = () => {
    axios
      .post('http://localhost:8001/login', { username, password })
      .then((response) => {
        console.log(response.data);

        // Save the user ID to localStorage upon successful login
        localStorage.setItem('user_id', response.data.user_id);

        // Navigate to the next page (replace '/quiz/select' with your desired destination)
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
      <h1>Welcome to the Quiz App!</h1>
      <div>
        <h2>Register</h2>
        {registrationSuccess && <p style={{ color: 'green' }}>Registration successful!</p>}
        {registrationError && <p style={{ color: 'red' }}>{registrationError}</p>}
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
         {/* Add "Confirm Password" input */}
         <input
          type="password"
          placeholder="Confirm Password"
          value={confirmPassword}
          onChange={(e) => setConfirmPassword(e.target.value)}
        />
        <button onClick={handleRegister}>Register</button>
      </div>

      <div>
        <h2>Login</h2>
        {loginError && <p style={{ color: 'red' }}>{loginError}</p>}
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