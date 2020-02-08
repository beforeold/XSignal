//
//  XSubscriber.m
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "XSubscriber.h"

@interface XSubscriber ()

@property (nonatomic, copy, readonly) void(^_Nullable nextHandler)(id);
@property (nonatomic, copy, readonly) void(^_Nullable completionHandler)(NSError *_Nullable);

@property BOOL terminated;

@end

@implementation XSubscriber

- (instancetype)initWithNextHandler:(void (^_Nullable)(id))nextHandler
                  completionHandler:(void (^_Nullable)(NSError *_Nullable))completionHandler
{
    self = [super init];
    if (self) {
        _nextHandler = [nextHandler copy];
        _completionHandler = [completionHandler copy];
    }
    
    return self;
}

- (void)receiveNext:(id)next {
    if (self.terminated) return;
    
    !self.nextHandler ?: self.nextHandler(next);
}

- (void)receiveCompletionWithError:(NSError *_Nullable)error {
    if (self.terminated) return;
    
    !self.completionHandler ?: self.completionHandler(error);
    self.terminated = YES;
}


@end
