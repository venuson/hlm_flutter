//
//  HlmFlutterRouter.m
//  Runner
//
//  Created by Rui Wei on 2020/2/7.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "HlmFlutterRouter.h"

@interface HlmFlutterRouter()
@property(nonatomic,weak) id<HlmNativePageRouter> mRouter;
@end

#define kParamKeyRouter  @"router"
#define kParamKeyQuery   @"query"

#define FLUTTER_NATIVE_TEST YES

@implementation HlmFlutterRouter
- (void)setPageRouter:(id<HlmNativePageRouter>) router
{
    self.mRouter = router;
}

- (void)open:(nonnull NSString *)pagePath //路由路径，可以是原生页面，H5页面，Flutter页面
   urlParams:(nonnull NSDictionary *)params
        exts:(nonnull NSDictionary *)exts   //exts 基本不用
  completion:(nonnull void (^)(BOOL))completion
{
    NSObject* obj = [[FlutterBoostPlugin sharedInstance] valueForKey: @"application"];
    NSObject* callbackCache = [obj valueForKey:@"callbackCache"];
    NSObject* cbBlock = [callbackCache valueForKey: [params valueForKey:kPageCallBackId]];
    
    if (FLUTTER_NATIVE_TEST) {
        if ([pagePath isEqualToString:@"/hybrid/fultter"]) {
            NSString * fluttePage = [[params valueForKey:kParamKeyRouter] valueForKey:@"flutterPage"];
            FLBFlutterViewContainer* vc = FLBFlutterViewContainer.new;
            [vc setName:fluttePage params:params];
            return;
        }
    }
    
    
    NSDictionary* queries = [params valueForKey:kParamKeyQuery];
    if (self.mRouter && [self.mRouter respondsToSelector:@selector(openPage:params:result:complition:)]) {
        [self.mRouter openPage:pagePath params:queries result:(void (^)(NSDictionary* ))cbBlock complition:completion];
    }
}

- (void)present:(NSString *)pagePath
      urlParams:(NSDictionary *)params
           exts:(NSDictionary *)exts
     completion:(void (^)(BOOL finished))completion
{
    [self open:pagePath urlParams:params exts:exts completion:completion];
}

- (void)close:(NSString *)uid
       result:(NSDictionary *)result
         exts:(NSDictionary *)exts
   completion:(void (^)(BOOL finished))completion
{
    
}



@end
