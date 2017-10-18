//
//  XSubscriber.m
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "XSubscriber.h"

@interface XSubscriber ()

@property (nonatomic, copy, readonly) void(^nextHandler)(id);
@property (nonatomic, copy, readonly) void(^errorHandler)(id);
@property (nonatomic, copy, readonly) void(^completionHandler)(void);

@property BOOL terminated;

@end

@implementation XSubscriber

- (instancetype)initWithNextHandler:(void (^)(id))nextHandler
                       errorHandler:(void (^)(id))errorHandler
                  completionHandler:(void (^)(void))completionHandler
{
    self = [super init];
    if (self) {
        _nextHandler = [nextHandler copy];
        _errorHandler = [errorHandler copy];
        _completionHandler = [completionHandler copy];
    }
    
    return self;
}

- (void)gotNext:(id)next {
    if (self.terminated) return;
    
    !self.nextHandler ?: self.nextHandler(next);
}

- (void)gotError:(id)error {
    if (self.terminated) return;
    
    !self.errorHandler ?: self.errorHandler(error);
    self.terminated = YES;
}

- (void)completed {
    if (self.terminated) return;
    
    !self.completionHandler ?: self.completionHandler();
    self.terminated = YES;
}

@end
