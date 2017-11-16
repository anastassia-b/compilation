import { connect } from 'react-redux';
import React from 'react';
import PokemonIndex from './pokemon_index';
import selectAllPokemon from '../reducers/selectors.js';
import { requestAllPokemon } from '../actions/pokemon_actions';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state)
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => dispatch(requestAllPokemon())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);
