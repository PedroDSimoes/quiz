import { combineReducers } from 'redux';

// Define initial state for the user
const initialUserState = {
  user_id: null,
  username: '',
  email: '',
};

// User reducer
const userReducer = (state = initialUserState, action) => {
  switch (action.type) {
    case 'LOGIN_USER':
      return action.payload;
    case 'LOGOUT_USER':
      return initialUserState;
    default:
      return state;
  }
};

// Combine all reducers into a single rootReducer
const rootReducer = combineReducers({
  user: userReducer,
});

export default rootReducer;