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
#import "XSignal+XFuntional.h"
#import "XSubscriber.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, strong) XDisposable disposable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)testSubscribe {
    self.disposable = [self.button.x_signal
                       subscribeWithNextHandler:^(id next) { NSLog(@"next -> %@", next); }
                       errorHandler:nil
                       completionHandler:nil];
    NSLog(@"subscribed %@", self.button);
}

- (void)testMap {
    self.disposable = [[self.button.x_signal map:^id(id next) { return @[next, next]; }]
                       subscribeWithNextHandler:^(id next) { NSLog(@"next -> %@", next); }
                       errorHandler:nil
                       completionHandler:nil];
    NSLog(@"subscribed %@", self.button);
}

@end


