//
//  XSignal+XOperators.m
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "XSignal+XOperators.h"
#import "XSubscriber.h"
#import "XSGMap.h"
#import "XSGFilter.h"
#import "XSGFlatMap.h"

@implementation XSignal (XOperators)

- (XSignal *)map:(id (^)(id))f {
    return [[XSGMap alloc] initWithUpstream:self transform:f];
}

- (XSignal *)filter:(BOOL (^)(id))f {
    return [[XSGFilter alloc] initWithUpstream:self filter:f];
}

- (XSignal *)flatMap:(XSignal *(^)(id))f {
    return [[XSGFlatMap alloc] initWithUpstream:self tranform:f];
}

@end
