//
//  RNFBMessenger.m
//  PerfectGifMessenger
//
//  Created by Brandon Fisch on 10/27/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "RNFBMessenger.h"
#import <FBSDKMessengerShareKit/FBSDKMessengerShareKit.h>

@implementation RNFBMessenger

@synthesize bridge = _bridge;

// Expose this module to the React Native bridge
RCT_EXPORT_MODULE()


// Load data from disk and return the String.
RCT_EXPORT_METHOD(sendGif:(NSString *) gifUrl
                  remoteUrl:(NSString *) remoteUrl
                  errorCallback:(RCTResponseSenderBlock)failureCallback
                  callback:(RCTResponseSenderBlock)successCallback) {
  
  NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));	
  
  NSString *metadata = [NSString stringWithFormat:@"{ \"image\" : \"%@\" }", remoteUrl];
    
  NSData *gifData = [NSData dataWithContentsOfURL : [NSURL URLWithString:gifUrl]];
  FBSDKMessengerShareOptions *options = [[FBSDKMessengerShareOptions alloc] init];
  options.metadata = metadata;
  
  [FBSDKMessengerSharer shareAnimatedGIF:gifData withOptions:options];
  
  successCallback(@[gifUrl]);
}

RCT_EXPORT_METHOD(backToMessenger){
  [FBSDKMessengerSharer openMessenger];
}

@end
