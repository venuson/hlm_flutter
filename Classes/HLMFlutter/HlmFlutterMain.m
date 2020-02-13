//
//  HlmFlutterMain.m
//  Runner
//
//  Created by Rui Wei on 2020/2/7.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "HlmFlutterMain.h"
#import "HlmFlutterRouter.h"
#import "HlmFlutterPlugin.h"

@interface HlmFlutterMain ()
@property(nonatomic, strong)HlmFlutterRouter* hlmRouter;
@property(nonatomic, strong)HlmFlutterPlugin* plugin;
@end

@implementation HlmFlutterMain
+ (HlmFlutterMain *)shareInstance
{
    static dispatch_once_t onceToken;
    static HlmFlutterMain *instance;
    dispatch_once(&onceToken, ^{
        instance = [[HlmFlutterMain alloc] init];
    });
    return instance;
}


+ (void) initFlutterWithEventHandler:(id<HlmNativeEventHandler>) handler router:(id<HlmNativePageRouter>) router
{
    [HlmFlutterMain shareInstance].hlmRouter = [[HlmFlutterRouter alloc] init];
    [[HlmFlutterMain shareInstance].hlmRouter setPageRouter:router];
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:[HlmFlutterMain shareInstance].hlmRouter
                                                        onStart:^(FlutterEngine *engine) {
        [HlmFlutterPlugin registerWithRegistrar:[engine registrarForPlugin:@"HlmFlutterPlugin"]];
                                                        }];
}
@end
