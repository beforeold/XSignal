//
//  XSGFlatMap.h
//  TestMySignal
//
//  Created by brook.dinglan on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSGGenerator.h"

NS_ASSUME_NONNULL_BEGIN

@interface XSGFlatMap : XSGGenerator

- (instancetype)initWithUpstream:(XSGGenerator *)upstream tranform:(XSGGenerator *(^)(id))tranform;

@end

NS_ASSUME_NONNULL_END
