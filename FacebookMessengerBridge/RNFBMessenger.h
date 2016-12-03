//
//  RNFBMessenger.h
//  PerfectGifMessenger
//
//  Created by Brandon Fisch on 10/27/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>

@interface RNFBMessenger : NSObject <RCTBridgeModule>
@property (nonatomic, strong) NSString *reply;
@end
