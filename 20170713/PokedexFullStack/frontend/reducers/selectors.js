import { values } from 'lodash';

const selectAllPokemon = (state) => {
  return values(state.pokemon.entities);
}

export default selectAllPokemon;
