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
        return [signal subscribeWithNextHandler:^(id x) {
            [subscriber receiveNext:f(x)];
        } completionHandler:^(NSError * _Nullable error) {
            [subscriber receiveCompletionWithError:error];
        }];
    }];
    
    return self;
}

@end
