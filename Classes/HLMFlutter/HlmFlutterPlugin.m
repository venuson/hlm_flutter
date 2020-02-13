//
//  HlmFlutterPlugin.m
//  Runner
//
//  Created by Rui Wei on 2020/2/7.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "HlmFlutterPlugin.h"
#import "HlmNativeEventHandler.h"

#define CHANNEL_NAME_HLM_CHANNEL    @"com.huifu.hlm/flutterPlugin"
@interface HlmFlutterPlugin ()
@property (nonatomic, strong) FlutterMethodChannel *methodChannel;
@property (nonatomic, strong) id<HlmNativeEventHandler> mNativeEventHandler;
@end

@implementation HlmFlutterPlugin

+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:CHANNEL_NAME_HLM_CHANNEL binaryMessenger:[registrar messenger]];
    HlmFlutterPlugin* plugin = [[HlmFlutterPlugin alloc]init];
    [registrar addMethodCallDelegate:plugin channel:channel];
}

#pragma Handle native method
- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result
{
    NSString *method = call.method;
    if (self.mNativeEventHandler && [self.mNativeEventHandler respondsToSelector:@selector(handleMethod:params:result:)]) {
        BOOL re = [self.mNativeEventHandler handleMethod:method params:call.arguments result:^(id resp) {
            if (resp && [resp isKindOfClass:[NSDictionary class]]) {
                NSNumber* code = (NSNumber*)[resp valueForKey:@"code"];
                if (code && [code intValue] == 0) {
                    result([resp valueForKey:@"data"]);
                } else {
                    result(NULL);
                }
            }
        }];
        if (!re) {
            result(NULL);
        };
    }
    
}

@end
