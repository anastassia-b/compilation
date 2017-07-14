import * as Util from '../util/api_util.js';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON";
export const RECEIVE_ITEMS = "RECEIVE_ITEMS";

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receiveSinglePokemon = payload => ({
  type: RECEIVE_SINGLE_POKEMON,
  payload
});

export const receiveItems = payload => ({
  type: RECEIVE_ITEMS,
  payload
});

export const requestAllPokemon = () => dispatch => {
  return Util.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};


export const requestSinglePokemon = (id) => (dispatch) => {
  return Util.fetchSinglePokemon(id)
    .then(pokemon => dispatch(receiveSinglePokemon(pokemon)));
};
