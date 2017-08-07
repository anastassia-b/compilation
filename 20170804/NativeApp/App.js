import React from 'react';
import { StyleSheet, Text, View, Image } from 'react-native';

export default class App extends React.Component {
  render() {
    let pic = {
      uri: 'http://livelovefruit.com/wp-content/uploads/2015/06/Benefits-of-eating-fruit-forbreakfast.jpg'
    };

    // return (
    //   <View style={styles.container}>
    //     <Text style={styles.bigred}>Hello World!</Text>
    //     <Greeting name='Anastassia' />
    //     <Image source={pic} style={{width: 193, height: 110}}/>
    //     <Blink text="This text, it's blinking" />
    //     <TextInANest/>
    //   </View>
    // );

    return (
      <Dimensions/>
    );
  }
}

class Dimensions extends React.Component {
  render() {
    return (
      <View style={{
          flex: 1,
          flexDirection: 'row', //primary axis (column default)
          justifyContent: 'space-between', //along primary axis
          alignItems: 'center' //along secondary axis
        }}>
        <View style={{width: 50, height: 50, backgroundColor: 'powderblue'}} />
        <View style={{width: 50, height: 50, backgroundColor: 'skyblue'}} />
        <View style={{width: 50, height: 50, backgroundColor: 'steelblue'}} />
      </View>
    );
  }
}

class Greeting extends React.Component {
  render() {
    return (
      <Text style={styles.blue}>Hi {this.props.name}!</Text>
    );
  }
}

class Blink extends React.Component {
  constructor(props) {
    super(props);
    this.state = {showText: true};

    //Toggle state every 2 seconds
    setInterval(() => {
      this.setState(previousState => {
        return { showText: !previousState.showText };
      });
    }, 2000);
  }

  render() {
    let display = this.state.showText ? this.props.text : ' ';
    return (
      <Text>{display}</Text>
    );
  }
}

class TextInANest extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      titleText: "Bird's Next",
      bodyText: 'This is the beginning of a story.'
    };
  }

  render() {
    return (
      <Text style={styles.baseText}>
        <Text style={styles.titleText}>
          {this.state.titleText}{'\n'}{'\n'}
        </Text>
        <Text>{this.state.bodyText}</Text>
      </Text>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'pink',
    alignItems: 'center',
    justifyContent: 'center',
  },
  bigred: {
    color: 'red',
    fontWeight: 'bold',
    fontSize: 30,
  },
  blue: {
    color: 'blue'
  },
  baseText: {
    fontFamily: 'Cochin',
  },
  titleText: {
    fontSize: 20,
    fontWeight: 'bold',
  },
});
