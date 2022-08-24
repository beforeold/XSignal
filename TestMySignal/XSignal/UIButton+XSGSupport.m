//
//  UIButton+XSGSupport.m
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "UIButton+XSGSupport.h"
#import <objc/runtime.h>
#import "XSignal.h"
#import "XSubscriber.h"

@interface XButtonTargetAction : NSObject

@property (nonatomic, weak) XSubscriber *subscriber;

- (void)onClick:(id)sender;

@end

@implementation XButtonTargetAction

- (void)onClick:(id)sender {
    [self.subscriber receiveValue:sender];
}

@end

@implementation UIButton (XSGSupport)
- (XSignal *)xsg_signal {
    XSignal *signal = objc_getAssociatedObject(self, _cmd);
    if (!signal) {
        signal = [self x_createSignal];
        objc_setAssociatedObject(self, _cmd, signal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return signal;
}

- (XSignal *)x_createSignal {
    __weak typeof(self) weakSelf = self;
    XSignal *signal = [[XSignal alloc] initWithGenerator:^XDisposable(XSubscriber *subscriber) {
        XButtonTargetAction *holder = [[XButtonTargetAction alloc] init];
        holder.subscriber = subscriber;
        [weakSelf addTarget:holder action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        return holder;
    }];
    
    return signal;
}

@end
