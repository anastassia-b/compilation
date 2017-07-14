import merge from 'lodash/merge';
import { RECEIVE_ITEMS } from '../actions/pokemon_actions.js';

const itemReducer = (state = [], action) => {
  switch(action.type) {
    case RECEIVE_ITEMS:
      return action.payload.items;
    default:
      return state;
  }
};

export default itemReducer;
