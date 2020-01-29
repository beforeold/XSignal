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

- (XSignal *)map:(id(^)(id _Nullable))f;

- (XSignal *)filter:(BOOL(^)(id _Nullable))f;

- (XSignal *)flatMap:(XSignal *(^)(id _Nullable))f;

@end

NS_ASSUME_NONNULL_END
