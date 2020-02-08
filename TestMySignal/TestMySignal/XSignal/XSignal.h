//
//  XSignal.h
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSubscriber.h"

NS_ASSUME_NONNULL_BEGIN

@class XSubscriber;
typedef id XDisposable;

typedef XDisposable _Nullable (^XGenerator)(XSubscriber *subscriber);

@interface XSignal : NSObject

- (instancetype)initWithGenerator:(XGenerator)generator;

+ (instancetype)signalWithGenerator:(XGenerator)generator;

- (XDisposable)subscribeWithNextHandler:(void(^_Nullable)(id))nextHandler;

- (XDisposable)subscribeWithCompletionHandler:(void(^_Nullable)(NSError *_Nullable error))comletionHandler;

- (XDisposable)subscribeWithNextHandler:(void(^_Nullable)(id))nextHandler completionHandler:(void(^_Nullable)(NSError *_Nullable error))comletionHandler;

@end

NS_ASSUME_NONNULL_END
