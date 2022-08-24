//
//  XSGMap.h
//  TestMySignal
//
//  Created by beforeold on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSGGenerator.h"

NS_ASSUME_NONNULL_BEGIN

@interface XSGMap : XSGGenerator

- (instancetype)initWithUpstream:(XSGGenerator *)upstream transform:(id(^)(id x))transform;

@end

NS_ASSUME_NONNULL_END
