//
//  ViewController.m
//  TestMySignal
//
//  Created by Brook on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "ViewController.h"

#import "XSignal.h"
#import "UIButton+XSignal.h"
#import "XSignal+XOperators.h"
#import "XSubscriber.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, strong) XDisposable disposable;
@property (nonatomic, assign) NSInteger counter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testFlatMap];
}

- (void)testSubscribe {
    self.disposable = [self.button.x_signal subscribeWithNextHandler:^(id _Nullable next) { NSLog(@"next -> %@", next); }
                                                   completionHandler:nil];
}

- (void)testMap {
    self.disposable = [[self.button.x_signal
                        map:^id(id _Nullable next) { return @[next, next]; }]
                       subscribeWithNextHandler:^(id next) { NSLog(@"next -> %@", next); } completionHandler:nil];
}

- (void)testFilter {
    self.disposable = [[[self.button.x_signal
                         map:^id _Nonnull(id _Nullable _) { return @(arc4random_uniform(100)); }]
                        filter:^BOOL(id _Nullable x) { return [x integerValue] > 50; }]
                       subscribeWithNextHandler:^(id _Nullable x) { NSLog(@"next: %@", x); } completionHandler:nil];
}

- (void)testFlatMap {
    self.disposable = [[self.button.x_signal
                        flatMap:^XSignal * _Nonnull(id _Nullable _) { return [self plusOneSignal]; }]
                       subscribeWithNextHandler:^(id _Nullable x) { NSLog(@"flat next: %@", x); }
                       completionHandler:^(NSError * _Nullable error) { NSLog(@"flat map completed: %@", error); }];
}

- (XSignal *)plusOneSignal {
    return [XSignal signalWithGenerator:^XDisposable _Nullable(XSubscriber * _Nonnull subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber receiveNext:@(self.counter++)];
        });
        [subscriber receiveCompletionWithError:nil];
        
        return nil;
    }];
}

@end


