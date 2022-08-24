//
//  XSGMap.h
//  TestMySignal
//
//  Created by brook.dinglan on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSGGenerator.h"

NS_ASSUME_NONNULL_BEGIN

@interface XSGMap : XSGGenerator

- (instancetype)initWithUpstream:(XSGGenerator *)signal transform:(id(^)(id x))f;

@end

NS_ASSUME_NONNULL_END
