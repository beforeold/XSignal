//
//  XSignal.m
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "XSignal.h"
#import "XSubscriber.h"


@interface XSubscriberDisposable : NSObject

- (instancetype)initWithSubscriber:(XSubscriber *)subscriber disposable:(XDisposable _Nullable)XDisposable;

@end

@interface XSubscriberDisposable ()

@property (nonatomic, readonly) XSubscriber *subscriber;
@property (nonatomic, readonly) XDisposable disposable;

@end

@implementation XSubscriberDisposable
- (instancetype)initWithSubscriber:(XSubscriber *)subscriber disposable:(XDisposable)disposable {
    self = [super init];
    if (self) {
        _subscriber = subscriber;
        _disposable = disposable;
    }
    
    return self;
}

@end


@interface XSignal ()

@property (nonatomic, copy, readonly) XGenerator generator;

@end

@implementation XSignal
- (instancetype)initWithGenerator:(XGenerator)generator {
    self = [super init];
    if (self) {
        _generator = [generator copy];
    }
    
    return self;
}

+ (instancetype)signalWithGenerator:(XGenerator)generator {
    return [[self alloc] initWithGenerator:generator];
}

- (XDisposable)subscribeWithValueHandler:(void(^_Nullable)(id))valueHandler {
    return [self subscribeWithValueHandler:valueHandler completionHandler:nil];
}

- (XDisposable)subscribeWithCompletionHandler:(void (^)(XSGCompletion *))comletionHandler {
    return [self subscribeWithValueHandler:nil completionHandler:comletionHandler];
}

- (XDisposable)subscribeWithValueHandler:(void (^_Nullable)(id))valueHandler completionHandler:(void (^_Nullable)(XSGCompletion *))comletionHandler
{
    XSubscriber *sub = [[XSubscriber alloc] initWithValueHandler:valueHandler completionHandler:comletionHandler];
    XDisposable subbedDisposable = _generator(sub);
    
    return [[XSubscriberDisposable alloc] initWithSubscriber:sub disposable:subbedDisposable];
}

@end
