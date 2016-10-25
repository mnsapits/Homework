import React from 'react';
import ReactDOM from 'react-dom';

import Note from './util/note.js';

import configureStore from './store/store';
import Root from './components/root';

const addLoggingToDispatch = (store) => (next) => (action) => {
  let OGDispatch = store.dispatch;
  console.log(store.getState());
  console.log(action);
  let returnValue = OGDispatch(action);
  console.log(store.getState());
  return returnValue;
}

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  const newStore = applyMiddlewares(store, addLoggingToDispatch);
  ReactDOM.render(<Root store={newStore} />, rootEl);
});

const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach((middlewares) => {
    dispatch = middlewares(store)(dispatch);
  });
  return Object.assign({}, store, {dispatch});
}
