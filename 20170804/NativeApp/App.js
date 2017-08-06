import React from 'react';
import { StyleSheet, Text, View, Image } from 'react-native';

export default class App extends React.Component {
  render() {
    let pic = {
      uri: 'http://livelovefruit.com/wp-content/uploads/2015/06/Benefits-of-eating-fruit-forbreakfast.jpg'
    };

    return (
      <View style={styles.container}>
        <Text>Hello World!</Text>
        <Image source={pic} style={{width: 193, height: 110}}/>
      </View>
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
});
