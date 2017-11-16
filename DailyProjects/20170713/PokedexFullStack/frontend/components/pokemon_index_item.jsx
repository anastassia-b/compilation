import React from 'react';
import { Link } from 'react-router-dom';


class PokemonIndexItem extends React.Component {

  render() {
    const pokemon = this.props.pokemon;
    return (
      <li>
        <Link to={`/pokemon/${pokemon.id}`}>
          <img className="pokemon" src={ pokemon.image_url }
            alt={ pokemon.name } />
          { pokemon.name }
        </Link>
      </li>
    )
  }
}

export default PokemonIndexItem;
