//
//  XSGFlatMap.m
//  TestMySignal
//
//  Created by beforeold on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSGFlatMap.h"

@implementation XSGFlatMap

- (instancetype)initWithUpstream:(XSGGenerator *)upstream tranform:(XSGGenerator * _Nonnull (^)(id _Nonnull))tranform {
    return [super initWithEmitter:^XSGDisposable _Nullable(XSGSubscriber * _Nonnull subscriber) {
        return [upstream subscribeWithValueHandler:^(id next) {
            XSGGenerator *innerSignal = tranform(next);
            /* XDisposable cancellable = */ [innerSignal subscribeWithValueHandler:^(id innerNext) {
                [subscriber receiveValue:innerNext];
            } completionHandler:^(XSGCompletion *completion) {
                if (completion.error) {
                    [subscriber receiveCompletion:completion];
                } else {
                    // won't complete the subscription when inner signal complete without error
                }
            }];
        } completionHandler:^(XSGCompletion *completion) {
            [subscriber receiveCompletion:completion];
        }];
    }];
}

@end
