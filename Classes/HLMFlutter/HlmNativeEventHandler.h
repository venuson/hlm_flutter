//
//  HlmNativeEventHandler.h
//  Runner
//
//  Created by Rui Wei on 2020/2/12.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HlmNativeEventHandler <NSObject>
@required
- (BOOL) handleMethod:(NSString*) methodName params:(NSDictionary*) params result:(void (^)(NSDictionary* data)) result;
@end
NS_ASSUME_NONNULL_END
