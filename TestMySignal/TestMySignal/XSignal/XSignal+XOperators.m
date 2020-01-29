//
//  XSignal+XOperators.m
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "XSignal+XOperators.h"
#import "XSubscriber.h"

@implementation XSignal (XOperators)

- (XSignal *)map:(id (^)(id _Nullable))f {
    return [[XSignal alloc] initWithGenerator:^XDisposable(XSubscriber *subscriber) {
        return [self subscribeWithNextHandler:^(id _Nullable next) { [subscriber receiveNext:f(next)]; }
                            completionHandler:^(NSError *_Nullable error){ [subscriber receiveCompletionWithError:error]; }];
    }];
}

- (XSignal *)filter:(BOOL (^)(id _Nullable))f {
    return [[XSignal alloc] initWithGenerator:^XDisposable(XSubscriber *subscriber) {
        return [self subscribeWithNextHandler:^(id _Nullable next){ if(f(next)) [subscriber receiveNext:next];}
                            completionHandler:^(NSError *_Nullable error){ [subscriber receiveCompletionWithError:error]; }];
    }];
}

- (XSignal *)flatMap:(XSignal * _Nonnull (^)(id _Nullable))f {
    return [XSignal signalWithGenerator:^XDisposable _Nullable(XSubscriber * _Nonnull subscriber) {
        return [self subscribeWithNextHandler:^(id _Nullable next) {
            XSignal *innerSignal = f(next);
            [innerSignal subscribeWithNextHandler:^(id _Nullable innerNext) {
                [subscriber receiveNext:innerNext];
            } completionHandler:^(NSError * _Nullable error) {
                [subscriber receiveCompletionWithError:error];
            }];
        } completionHandler:^(NSError * _Nullable error) {
            [subscriber receiveCompletionWithError:error];
        }];
    }];
}

@end
