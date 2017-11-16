import { merge } from 'lodash';
import { RECEIVE_ALL_POKEMON,
         RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions.js';

const _default = {entities: {}, currentPoke: null};

const pokemonReducer = (state = _default, action) => {

  switch(action.type) {

    case RECEIVE_ALL_POKEMON:
      const entities = action.pokemon;
      return merge({}, state, { entities: entities })

    case RECEIVE_SINGLE_POKEMON:
      // let currentPoke = action.poke.id;
      // return {entities: state.entities, currentPoke };
      const poke = action.payload.poke;
      return merge({}, state, {
        entities: { [poke.id]: poke },
        currentPoke: poke.id
      });

    default:
      return state;
  }
};

export default pokemonReducer;
