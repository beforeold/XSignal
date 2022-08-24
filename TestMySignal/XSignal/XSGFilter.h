//
//  XSGFilter.h
//  TestMySignal
//
//  Created by brook.dinglan on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSignal.h"

NS_ASSUME_NONNULL_BEGIN

@interface XSGFilter : XSignal

- (instancetype)initWithUpstream:(XSignal *)signal filter:(BOOL(^)(id))f;

@end

NS_ASSUME_NONNULL_END
