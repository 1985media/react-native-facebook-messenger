//
//  RCTFBMessengerButtonManager.m
//  PhotosphereMessenger
//
//  Created by Brandon Fisch on 11/4/15.
//  Copyright Â© 2015 Facebook. All rights reserved.
//

#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import "RCTViewManager.h"
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