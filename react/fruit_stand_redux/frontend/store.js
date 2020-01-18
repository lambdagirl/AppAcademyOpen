import { createStore } from 'redux';
import reducer from './reducer.js';
import { addOrange, addApple, addFruit,deleteFruit,clear } from './actions.js';

const store = createStore(reducer); // instantiate app's store with app's reducer

// put store and actions on the window
window.store = store;
window.addOrange = addOrange;
window.addApple = addApple;
window.addFruit = addFruit;
window.deleteFruit = deleteFruit;
window.clear = clear;
