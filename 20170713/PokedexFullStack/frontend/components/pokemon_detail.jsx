import React from 'react';

class PokemonDetail extends React.Component {
  constructor (props) {
    super(props);
    console.log(props);
    // const pokemonId = props.match.params.pokemonId
    // this.state = { pokemonId: props.match.params.pokemonId }
  }
  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId)
    // this.props.requestSinglePokemon(this.props.id);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId)
    }
  }

  render () {
    const { pokemon, items } = this.props;
    if (pokemon) {
      return (
        <div>
          {items}
        </div>
      );
    } else {
      return null;
    }
  }

}

export default PokemonDetail;
