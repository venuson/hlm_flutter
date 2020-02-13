//
//  HlmFlutterMain.h
//  Runner
//
//  Created by Rui Wei on 2020/2/7.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "HlmNativePageRouter.h"
#import "HlmNativeEventHandler.h"

NS_ASSUME_NONNULL_BEGIN


@protocol HlmNativeEventHandler;
@protocol HlmNativePageRouter;

@interface HlmFlutterMain : NSObject
+ (HlmFlutterMain *)shareInstance;
+ (void) initFlutterWithEventHandler:(id<HlmNativeEventHandler>) handler router:(id<HlmNativePageRouter>) router;
@end

NS_ASSUME_NONNULL_END
