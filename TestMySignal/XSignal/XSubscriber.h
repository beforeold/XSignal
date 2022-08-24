//
//  XSubscriber.h
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface XSGCompletion : NSObject

@property (class, nonatomic, readonly) XSGCompletion *finished;
@property (class, nonatomic, readonly) XSGCompletion *(^failure)(NSError *);

@property (nullable, nonatomic, readonly) NSError *error;

@end

@interface XSubscriber : NSObject

- (instancetype)initWithValueHandler:(void(^_Nullable)(id))valueHandler
                  completionHandler:(void(^_Nullable)(XSGCompletion *))completionHandler;

- (void)receiveValue:(id)value NS_SWIFT_NAME(receive(_:));
- (void)receiveCompletion:(XSGCompletion *)completion NS_SWIFT_NAME(receive(completion:));

@end

NS_ASSUME_NONNULL_END
