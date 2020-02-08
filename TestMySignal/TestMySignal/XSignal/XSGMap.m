//
//  XSGMap.m
//  TestMySignal
//
//  Created by brook.dinglan on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSGMap.h"

@implementation XSGMap

- (instancetype)initWithUpstream:(XSignal *)signal transform:(nonnull id  _Nonnull (^)(id _Nonnull))f {
    self = [super initWithGenerator:^XDisposable _Nullable(XSubscriber * _Nonnull subscriber) {
        return [signal subscribeWithValueHandler:^(id x) {
            [subscriber receiveValue:f(x)];
        } completionHandler:^(XSGCompletion *completion) {
            [subscriber receiveCompletion:completion];
        }];
    }];
    
    return self;
}

@end
