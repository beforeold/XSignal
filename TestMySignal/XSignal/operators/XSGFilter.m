//
//  XSGFilter.m
//  TestMySignal
//
//  Created by brook.dinglan on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSGFilter.h"

@implementation XSGFilter

- (instancetype)initWithUpstream:(XSGGenerator *)signal filter:(BOOL(^)(id))f {
    self = [super initWithGenerator:^XSGDisposable _Nullable(XSGSubscriber * _Nonnull subscriber) {
        return [signal subscribeWithValueHandler:^(id x) {
            if (f(x)) [subscriber receiveValue:x];
        } completionHandler:^(XSGCompletion *completion) {
            [subscriber receiveCompletion:completion];
        }];
    }];
    return self;
}

@end
