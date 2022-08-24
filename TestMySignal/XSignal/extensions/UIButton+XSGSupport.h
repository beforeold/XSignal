//
//  UIButton+XSGSupport.h
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSGGenerator.h"

@interface UIButton (XSGSupport)

@property (nonatomic, strong, readonly) XSGGenerator *xsg_generator;

@end
