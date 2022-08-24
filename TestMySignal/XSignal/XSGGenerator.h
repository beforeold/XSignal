//
//  XSGGenerator.h
//  TestMySignal
//
//  Created by beforeold on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSGSubscriber.h"

NS_ASSUME_NONNULL_BEGIN

@class XSGSubscriber;
typedef id XSGDisposable;

typedef XSGDisposable _Nullable (^XSGEmitter)(XSGSubscriber *subscriber);

@interface XSGGenerator : NSObject

- (instancetype)initWithEmitter:(XSGEmitter)emitter;

+ (instancetype)generatorWithEmitter:(XSGEmitter)emitter;

- (XSGDisposable)subscribeWithValueHandler:(void(^_Nullable)(id))valueHandler;

- (XSGDisposable)subscribeWithCompletionHandler:(void(^_Nullable)(XSGCompletion *))comletionHandler;

- (XSGDisposable)subscribeWithValueHandler:(void(^_Nullable)(id))valueHandler
                         completionHandler:(void(^_Nullable)(XSGCompletion *))comletionHandler;

@end

NS_ASSUME_NONNULL_END
