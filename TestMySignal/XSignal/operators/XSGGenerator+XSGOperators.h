//
//  XSGGenerator+XSGOperators.h
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "XSGGenerator.h"

NS_ASSUME_NONNULL_BEGIN

@interface XSGGenerator (XOperators)

- (XSGGenerator *)map:(id(^)(id))transform;

- (XSGGenerator *)filter:(BOOL(^)(id))filter;

- (XSGGenerator *)flatMap:(XSGGenerator *(^)(id))transform;

@end

NS_ASSUME_NONNULL_END
