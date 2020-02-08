//
//  XSGFlatMap.h
//  TestMySignal
//
//  Created by brook.dinglan on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSignal.h"

NS_ASSUME_NONNULL_BEGIN

@interface XSGFlatMap : XSignal

- (instancetype)initWithUpstream:(XSignal *)upstream tranform:(XSignal *(^)(id))f;

@end

NS_ASSUME_NONNULL_END
