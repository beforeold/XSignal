//
//  XSubscriber.h
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XSubscriber : NSObject

- (instancetype)initWithNextHandler:(void(^_Nullable)(id _Nullable))nextHandler
                  completionHandler:(void(^_Nullable)(NSError *_Nullable))completionHandler;

- (void)receiveNext:(id _Nullable)next;
- (void)receiveCompletionWithError:(NSError *_Nullable)error;

@end

NS_ASSUME_NONNULL_END
