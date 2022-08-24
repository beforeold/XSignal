//
//  UIButton+XSGSupport.m
//  TestMySignal
//
//  Created by beforeold on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "UIButton+XSGSupport.h"
#import <objc/runtime.h>
#import "XSGGenerator.h"
#import "XSGSubscriber.h"

@interface XSGButtonTargetAction : NSObject

@property (nonatomic, weak) XSGSubscriber *subscriber;

- (void)onClick:(id)sender;

@end

@implementation XSGButtonTargetAction

- (void)onClick:(id)sender {
    [self.subscriber receiveValue:sender];
}

@end

@implementation UIButton (XSGSupport)
- (XSGGenerator *)xsg_generator {
    XSGGenerator *signal = objc_getAssociatedObject(self, _cmd);
    if (!signal) {
        signal = [self xsg_createSignal];
        objc_setAssociatedObject(self, _cmd, signal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return signal;
}

- (XSGGenerator *)xsg_createSignal {
    __weak typeof(self) weakSelf = self;
    XSGGenerator *signal = [[XSGGenerator alloc] initWithEmitter:^XSGDisposable(XSGSubscriber *subscriber) {
        XSGButtonTargetAction *holder = [[XSGButtonTargetAction alloc] init];
        holder.subscriber = subscriber;
        [weakSelf addTarget:holder action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        return holder;
    }];
    
    return signal;
}

@end
