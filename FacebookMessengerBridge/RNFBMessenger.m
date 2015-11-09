//
//  RNFBMessenger.m
//  PerfectGifMessenger
//
//  Created by Brandon Fisch on 10/27/15.
//

#import "RNFBMessenger.h"
#import <FBSDKMessengerShareKit/FBSDKMessengerShareKit.h>

@implementation RNFBMessenger

@synthesize bridge = _bridge;

// Expose this module to the React Native bridge
RCT_EXPORT_MODULE()


// Load data from disk and return the String.
RCT_EXPORT_METHOD(send:(NSString *) mediaType
                  pathForResource:(NSString *) pathForResource
                  metadata:(NSString *) metadata
//                  errorCallback:(RCTResponseSenderBlock)failureCallback
//                  callback:(RCTResponseSenderBlock)successCallback
                  )
{
  
  NSData *data = [NSData dataWithContentsOfURL : [NSURL URLWithString:pathForResource]];
  FBSDKMessengerShareOptions *options = [[FBSDKMessengerShareOptions alloc] init];
  options.metadata = metadata;
  
  if([mediaType isEqualToString: @"image"]){
    [FBSDKMessengerSharer shareAnimatedGIF:data withOptions:options];
  } else if ([mediaType isEqualToString:@"gif"]){
    [FBSDKMessengerSharer shareAnimatedGIF:data withOptions:options];
  } else if ([mediaType isEqualToString:@"video"]){
    [FBSDKMessengerSharer shareVideo:data withOptions:options];
  } else if ([mediaType isEqualToString:@"audio"]){
    [FBSDKMessengerSharer shareAudio:data withOptions:options];
  }
  
  
//  successCallback(@[gifUrl]);
}

RCT_EXPORT_METHOD(backToMessenger){
  [FBSDKMessengerSharer openMessenger];
}

@end
