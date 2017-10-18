//
//  XSubscriber.h
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSubscriber : NSObject

- (instancetype)initWithNextHandler:(void(^)(id))nextHandler
                       errorHandler:(void(^)(id))errorHandler
                  completionHandler:(void(^)(void))completionHandler;

- (void)gotNext:(id)next;
- (void)gotError:(id)error;
- (void)completed;

@end
