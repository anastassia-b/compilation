import React from 'react';
import { StyleSheet, Text, View, Image, TextInput, Button, Alert, ScrollView, FlatList } from 'react-native';

export default class App extends React.Component {
  render() {
    let pic = {
      uri: 'http://livelovefruit.com/wp-content/uploads/2015/06/Benefits-of-eating-fruit-forbreakfast.jpg'
    };

    // return (
    //   <View style={styles.container}>
    //     <TextTranslator/>
    //     <Text style={styles.bigred}>Hello World!</Text>
    //     <Greeting name='Anastassia' />
    //     <Image source={pic} style={{width: 200, height: 120}}/>
    //     <Blink text="This text, it's blinking" />
    //     <TextInANest/>
    //     <ButtonBasics/>
    //     <Scrolling/>
    //   </View>
    // );

    return (
      <BasicFlatList/>
    );
  }
}


class BasicFlatList extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <FlatList
          data={[
            {key: 'David'},
            {key: 'Anastassia'},
            {key: 'Atom'}
          ]}
          renderItem={({item}) => <Text style={styles.item}>{item.key}</Text>}
        />
      </View>
    );
  }
}

class Scrolling extends React.Component {
  render() {
    let pic = {
      uri: 'http://livelovefruit.com/wp-content/uploads/2015/06/Benefits-of-eating-fruit-forbreakfast.jpg'
    };

    return (
      <ScrollView>
        <Text>Scroll Down!</Text>
        <Image source={pic} style={{width: 400, height: 400}}/>
        <Text>Scroll Down!</Text>
        <Image source={pic} style={{width: 400, height: 400}}/>
        <Text>End of the page</Text>
      </ScrollView>
    )
  }
}

class ButtonBasics extends React.Component {
  _onPressButton() {
    Alert.alert('You tapped the button!')
  }

  render() {
    return (
      <View style={styles.container}>
        <View style={styles.buttonContainer}>
          <Button
            onPress={this._onPressButton}
            title="Press Me"
          />
        </View>
        <View style={styles.alternativeButtonContainer}>
          <Button
            onPress={this._onPressButton}
            title="Looking good"
            color="#841584"
          />
          <Button
            onPress={this._onPressButton}
            title="Ok!"
            color="#841584"
          />
        </View>
      </View>
    )
  }
}


class TextTranslator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {text: ''};
  }

  render() {
    return (
      <View style={{padding: 10}}>
        <TextInput
          style={{height: 40}}
          placeholder="Type here to translate!"
          onChangeText={(text) => this.setState({text})}
        />
        <Text style={{padding: 10, fontSize: 42}}>
          {this.state.text.split(' ').map((word) => word && `${word}🍕`).join(' ')}
        </Text>
      </View>
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
    paddingTop: 20,
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
  buttonContainer: {
    margin: 20
  },
  alternativeButtonContainer: {
    margin: 20,
    flexDirection: 'row',
    justifyContent: 'space-between'
  },
  item: {
    padding: 10,
    fontSize: 18,
    height: 44
  },
  sectionHeader: {
    paddingTop: 2,
    paddingLeft: 10,
    paddingRight: 10,
    paddingBottom: 2,
    fontSize: 14,
    fontWeight: 'bold',
    backgroundColor: 'rgba(247,247,247,1.0)',
  }
});
