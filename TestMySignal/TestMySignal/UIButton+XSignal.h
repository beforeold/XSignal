//
//  UIButton+XSignal.h
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSignal.h"

@interface UIButton (XSignal)

@property (nonatomic, strong, readonly) XSignal *x_signal;

@end
