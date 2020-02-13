//
//  HlmNativePageRouter.h
//  Runner
//
//  Created by Rui Wei on 2020/2/11.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HlmNativePageRouter <NSObject>

@required
- (void) openPage:(NSString*)path params:(NSDictionary*) params result:(void (^)(NSDictionary* data)) result complition:(void (^)(BOOL com)) complition;
@end

NS_ASSUME_NONNULL_END
