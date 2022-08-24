//
//  XSGMap.m
//  TestMySignal
//
//  Created by beforeold on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSGMap.h"

@implementation XSGMap

- (instancetype)initWithUpstream:(XSGGenerator *)upstream transform:(nonnull id  _Nonnull (^)(id _Nonnull))transform {
    self = [super initWithEmitter:^XSGDisposable _Nullable(XSGSubscriber * _Nonnull subscriber) {
        return [upstream subscribeWithValueHandler:^(id x) {
            [subscriber receiveValue:transform(x)];
        } completionHandler:^(XSGCompletion *completion) {
            [subscriber receiveCompletion:completion];
        }];
    }];
    
    return self;
}

@end
