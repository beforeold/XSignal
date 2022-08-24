//
//  XSGFilter.m
//  TestMySignal
//
//  Created by beforeold on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSGFilter.h"

@implementation XSGFilter

- (instancetype)initWithUpstream:(XSGGenerator *)upstream filter:(BOOL(^)(id))filter {
    self = [super initWithEmitter:^XSGDisposable _Nullable(XSGSubscriber * _Nonnull subscriber) {
        return [upstream subscribeWithValueHandler:^(id x) {
            if (filter(x)) {
                [subscriber receiveValue:x];
            }
        } completionHandler:^(XSGCompletion *completion) {
            [subscriber receiveCompletion:completion];
        }];
    }];
    return self;
}

@end
