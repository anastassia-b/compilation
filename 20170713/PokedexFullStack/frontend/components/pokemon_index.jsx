import React from 'react';
import PokemonIndexItem from './pokemon_index_item'
import PokemonDetailContainer from './pokemon_detail_container'
import { Route } from 'react-router-dom';

class PokemonIndex extends React.Component {

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render () {
    //CHANGE TO POKEMON.ENTITIES
    const pokemon = this.props.pokemon;
    const pokemonItems = pokemon.map(poke => <PokemonIndexItem key={poke.id} pokemon={poke} />);
    return (
      <section className="pokedex">
        // <Route path="/pokemon/:pokemonId" render={props => <span>Num: {props.match.params.pokemonId}</span>} />
        <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer}/>
        <ul>
          {pokemonItems}
        </ul>
      </section>
    )
  }

}

export default PokemonIndex;
