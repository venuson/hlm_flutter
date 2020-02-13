//
//  HlmFlutterRouter.h
//  Runner
//
//  Created by Rui Wei on 2020/2/7.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FlutterBoost.h"
#import "HlmNativePageRouter.h"


NS_ASSUME_NONNULL_BEGIN

@protocol HlmNativePageRouter;
@protocol FLBPlatform;

@interface HlmFlutterRouter : NSObject<FLBPlatform>
- (void)setPageRouter:(id<HlmNativePageRouter>) router;
@end

NS_ASSUME_NONNULL_END
