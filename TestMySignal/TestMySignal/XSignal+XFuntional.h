//
//  XSignal+XFuntional.h
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "XSignal.h"

@interface XSignal (XFuntional)

- (XSignal *)map:(id(^)(id))f;

- (XSignal *)filter:(BOOL(^)(id))f;

@end
