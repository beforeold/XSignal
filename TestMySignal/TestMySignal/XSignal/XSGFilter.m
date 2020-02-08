//
//  XSGFilter.m
//  TestMySignal
//
//  Created by brook.dinglan on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSGFilter.h"

@implementation XSGFilter

- (instancetype)initWithUpstream:(XSignal *)signal filter:(BOOL(^)(id))f {
    self = [super initWithGenerator:^XDisposable _Nullable(XSubscriber * _Nonnull subscriber) {
        return [signal subscribeWithNextHandler:^(id x) {
            if (f(x)) [subscriber receiveNext:x];
        } completionHandler:^(NSError * _Nullable error) {
            [subscriber receiveCompletionWithError:error];
        }];
    }];
    return self;
}

@end
