//
//  XSignal+XOperators.h
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "XSignal.h"

NS_ASSUME_NONNULL_BEGIN

@interface XSignal (XOperators)

- (XSignal *)map:(id(^)(id))f;

- (XSignal *)filter:(BOOL(^)(id))f;

- (XSignal *)flatMap:(XSignal *(^)(id))f;

@end

NS_ASSUME_NONNULL_END
