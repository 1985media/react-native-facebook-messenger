# react-native-facebook-messenger
A React Native Module and UI Component used to integrate Facebook Messenger functionality into a React Native application.

This package contains a Native Module which exposes the Send to Messenger functionality as well as a Native UI Component which expose the Send to Messenger button from the SDK. 

Assumptions
-----------

You have already created a Facebook Applicaiton and have added the FacebookSDK into your XCode project.  To use Facebook Messenger, you only need to have FBSDKManagerShareKit.framework added.


Install
-------

Make sure that you are in your React Native project directory and run:

```npm install react-native-facebook-messenger --save```


Setup
-----

Add the FacebookSDK

Copy the folder ```FacebookMessengerBridge``` into the Libraries folder in your XCode project.


Usage for Back to Messenger Button
-----

```javascript
var FBMessengerButton = require('react-native-facebook-messenger');


class BackToMessenger extends React.Component{

    constructor(props){
        super(props);
    }

    render() {
        return (
            <TouchableHighlight onPress={()=>{FBMessengerButton.backToMessenger();}}>
                <View>
                    <Text>Back to</Text>
                    <Text>Messenger</Text>
                </View>
            </TouchableHighlight>
        );
    }
}
```


Usage for Send to Messenger Button
-----

```javascript
var FBMessengerButton = require('../Components/FBMessengerButton');


class Send extends React.Component{

    sendToMessenger(){
      
      var url = 'some local path to an image that is being shared',
          remoteUrl = 'a string that is included as metadata on the message.'
      
      RNFBMessenger.sendGif(
          url,
          photoObject.get('imageObj').url(),
          function errorCallback(results) {
              //alert('Error: ' + results);
          },
          function successCallback(results) {
              //alert('Success : ' + results);
          }
      );
    }

    render() {
        return (
            <TouchableWithoutFeedback style={styles.sendToMessengerWrapper} onPress={this.sendToMessenger.bind(this)}>
              <FBMessengerButton.Button style={styles.sendToMessengerWrapper} />
            </TouchableWithoutFeedback>
        );
    }
}

var styles = StyleSheet.create({
    sendToMessengerWrapper: {
        width: 300,
        height: 50,
        backgroundColor: '#0084ff',
        flex: 1,
        alignSelf: 'center',
    }
});
```
