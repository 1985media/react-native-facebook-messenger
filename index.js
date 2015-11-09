var React = require('react-native');
var {
    requireNativeComponent,
    NativeModules
    } = React;

class FBMessengerButton extends React.Component {

    render() {
        return <RCTFBMessengerButton {...this.props}/>;
    }
}

FBMessengerButton.propTypes = {
    /**
     * When this property is set to `true` and a valid camera is associated
     * with the map, the camera’s pitch angle is used to tilt the plane
     * of the map. When this property is set to `false`, the camera’s pitch
     * angle is ignored and the map is always displayed as if the user
     * is looking straight down onto it.
     */
    //pitchEnabled: React.PropTypes.bool,
};

var RCTFBMessengerButton = requireNativeComponent('RCTFBMessengerButton', FBMessengerButton);

const ShareType = {
    image: 'image',
    gif: 'gif',
    video: 'video',
    audio: 'audio',
};

function send(type, filePath, metadata){
    if(type in ShareType) {
        if(typeof metadata !== 'string'){
            metadata = JSON.stringify(metadata);
        }
        NativeModules.RNFBMessenger.send(type, filePath, metadata);
    } else {
        throw new Error(`
        "${type}" is not a valid type for this method.
            Valid values are: ShareType.image, ShareType.gif, ShareType.video, ShareType.audio`);
    }
}

module.exports = {
    Button: FBMessengerButton,
    backToMessenger: NativeModules.RNFBMessenger.backToMessenger,
    send: send,
    ShareType: ShareType,
};