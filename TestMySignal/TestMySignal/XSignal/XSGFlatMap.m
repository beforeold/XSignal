//
//  XSGFlatMap.m
//  TestMySignal
//
//  Created by brook.dinglan on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSGFlatMap.h"

@implementation XSGFlatMap

- (instancetype)initWithUpstream:(XSignal *)upstream tranform:(XSignal * _Nonnull (^)(id _Nonnull))f {
    return [super initWithGenerator:^XDisposable _Nullable(XSubscriber * _Nonnull subscriber) {
        return [upstream subscribeWithNextHandler:^(id next) {
            XSignal *innerSignal = f(next);
            /* XDisposable cancellable = */ [innerSignal subscribeWithNextHandler:^(id innerNext) {
                [subscriber receiveNext:innerNext];
            } completionHandler:^(NSError * _Nullable error) {
                if (error) {
                    [subscriber receiveCompletionWithError:error];
                } else {
                    // won't complete the subscription when inner signal complete without error
                }
            }];
        } completionHandler:^(NSError * _Nullable error) {
            [subscriber receiveCompletionWithError:error];
        }];
    }];
}

@end
