//
//  XSignal.h
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XSubscriber;
typedef id XDisposable;

typedef XDisposable(^XGenerator)(XSubscriber *subscriber);

@interface XSignal : NSObject

- (instancetype)initWithGenerator:(XGenerator)generator;

- (XDisposable)subscribeWithNextHandler:(void(^)(id))nextHandler
                    errorHandler:(void(^)(id))errorHandler
               completionHandler:(void(^)(void))comletionHandler;

@end
