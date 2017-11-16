import { connect } from 'react-redux';
import React from 'react';
import PokemonDetail from './pokemon_detail'
import { requestSinglePokemon, receiveSinglePokemon } from '../actions/pokemon_actions';

const mapStateToProps = state => ({
  //take in ID
  // currentPoke: receiveSinglePokemon(state.pokemon.currentPoke)
  pokemon: state.pokemon.entities[state.pokemon.currentPoke],
  // pokemon: state.pokemon.currentPoke,
  items: state.items
});

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
