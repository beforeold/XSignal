//
//  XSGGenerator+XSGOperators.m
//  TestMySignal
//
//  Created by beforeold on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "XSGGenerator+XSGOperators.h"
#import "XSGSubscriber.h"
#import "XSGMap.h"
#import "XSGFilter.h"
#import "XSGFlatMap.h"

@implementation XSGGenerator (XOperators)

- (XSGGenerator *)map:(id (^)(id))transform {
    return [[XSGMap alloc] initWithUpstream:self transform:transform];
}

- (XSGGenerator *)filter:(BOOL (^)(id))filter {
    return [[XSGFilter alloc] initWithUpstream:self filter:filter];
}

- (XSGGenerator *)flatMap:(XSGGenerator *(^)(id))transform {
    return [[XSGFlatMap alloc] initWithUpstream:self tranform:transform];
}

@end
