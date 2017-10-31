//
//  XSignal+XFuntional.m
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "XSignal+XFuntional.h"
#import "XSubscriber.h"

@implementation XSignal (XFuntional)

- (XSignal *)map:(id (^)(id))f {
    return [[XSignal alloc] initWithGenerator:^XDisposable(XSubscriber *subscriber) {
        return [self subscribeWithNextHandler:^(id next) { [subscriber gotNext:f(next)]; }
                                 errorHandler:^(id error) { [subscriber gotError:error]; }
                            completionHandler:^{ [subscriber completed]; }];
    }];
}

- (XSignal *)filter:(BOOL (^)(id))f {
    return [[XSignal alloc] initWithGenerator:^XDisposable(XSubscriber *subscriber) {
        return [self subscribeWithNextHandler:^(id next){ if(f(next)) [subscriber gotNext:next];}
                                 errorHandler:^(id error) { [subscriber gotError:error]; }
                            completionHandler:^{ [subscriber completed]; }];
    }];
}


@end
