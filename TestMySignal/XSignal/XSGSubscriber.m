//
//  XSGSubscriber.m
//  TestMySignal
//
//  Created by beforeold on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "XSGSubscriber.h"

@interface XSGCompletion ()

@property (nullable, nonatomic, readwrite) NSError *error;

@end

@implementation XSGCompletion

+ (XSGCompletion *)finished {
    static id shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

+ (XSGCompletion * _Nonnull (^)(NSError * _Nonnull))failure {
    return ^XSGCompletion *(NSError *error){
        XSGCompletion *completion = [[XSGCompletion alloc] init];
        completion.error = error;
        return completion;
    };
}

@end

@interface XSGSubscriber ()

@property (nonatomic, copy, readonly) void(^_Nullable valueHandler)(id);
@property (nonatomic, copy, readonly) void(^_Nullable completionHandler)(XSGCompletion *);

@property BOOL terminated;

@end

@implementation XSGSubscriber

- (instancetype)initWithValueHandler:(void (^_Nullable)(id))valueHandler
                  completionHandler:(void (^_Nullable)(XSGCompletion *))completionHandler
{
    self = [super init];
    if (self) {
        _valueHandler = [valueHandler copy];
        _completionHandler = [completionHandler copy];
    }
    
    return self;
}

- (void)receiveValue:(id)value {
    if (self.terminated) return;
    
    !self.valueHandler ?: self.valueHandler(value);
}

- (void)receiveCompletion:(XSGCompletion *)completion {
    if (self.terminated) return;
    
    !self.completionHandler ?: self.completionHandler(completion);
    self.terminated = YES;
}


@end
