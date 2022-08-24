//
//  XSGFilter.h
//  TestMySignal
//
//  Created by beforeold on 2020/2/8.
//  Copyright © 2020 Brook. All rights reserved.
//

#import "XSGGenerator.h"

NS_ASSUME_NONNULL_BEGIN

@interface XSGFilter : XSGGenerator

- (instancetype)initWithUpstream:(XSGGenerator *)upstream filter:(BOOL(^)(id))filter;

@end

NS_ASSUME_NONNULL_END
