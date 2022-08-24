//
//  XSGGenerator.m
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "XSGGenerator.h"
#import "XSGSubscriber.h"


@interface XSubscriberDisposable : NSObject

- (instancetype)initWithSubscriber:(XSGSubscriber *)subscriber disposable:(XSGDisposable _Nullable)XDisposable;

@end

@interface XSubscriberDisposable ()

@property (nonatomic, readonly) XSGSubscriber *subscriber;
@property (nonatomic, readonly) XSGDisposable disposable;

@end

@implementation XSubscriberDisposable
- (instancetype)initWithSubscriber:(XSGSubscriber *)subscriber disposable:(XSGDisposable)disposable {
    self = [super init];
    if (self) {
        _subscriber = subscriber;
        _disposable = disposable;
    }
    
    return self;
}

@end


@interface XSGGenerator ()

@property (nonatomic, copy, readonly) XSGEmitter generator;

@end

@implementation XSGGenerator
- (instancetype)initWithGenerator:(XSGEmitter)generator {
    self = [super init];
    if (self) {
        _generator = [generator copy];
    }
    
    return self;
}

+ (instancetype)signalWithGenerator:(XSGEmitter)generator {
    return [[self alloc] initWithGenerator:generator];
}

- (XSGDisposable)subscribeWithValueHandler:(void(^_Nullable)(id))valueHandler {
    return [self subscribeWithValueHandler:valueHandler completionHandler:nil];
}

- (XSGDisposable)subscribeWithCompletionHandler:(void (^)(XSGCompletion *))comletionHandler {
    return [self subscribeWithValueHandler:nil completionHandler:comletionHandler];
}

- (XSGDisposable)subscribeWithValueHandler:(void (^_Nullable)(id))valueHandler completionHandler:(void (^_Nullable)(XSGCompletion *))comletionHandler
{
    XSGSubscriber *sub = [[XSGSubscriber alloc] initWithValueHandler:valueHandler completionHandler:comletionHandler];
    XSGDisposable subbedDisposable = _generator(sub);
    
    return [[XSubscriberDisposable alloc] initWithSubscriber:sub disposable:subbedDisposable];
}

@end
