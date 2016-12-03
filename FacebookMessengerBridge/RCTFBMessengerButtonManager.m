//
//  RCTFBMessengerButtonManager.m
//  PhotosphereMessenger
//
//  Created by Brandon Fisch on 11/4/15.
//  Copyright Â© 2015 Facebook. All rights reserved.
//

#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>
#import <React/RCTViewManager.h>
#import <FBSDKMessengerShareKit/FBSDKMessengerShareKit.h>


@interface RCTFBMessengerButtonManager : RCTViewManager
@end


@implementation RCTFBMessengerButtonManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
  UIButton *button = [FBSDKMessengerShareButton rectangularButtonWithStyle:FBSDKMessengerShareButtonStyleBlue];
  return button;
}

@end
