//
//  ViewController.m
//  TestMySignal
//
//  Created by beforeold on 2017/10/18.
//  Copyright © 2017年 Brook. All rights reserved.
//

#import "ViewController.h"

#import "XSGGenerator.h"
#import "UIButton+XSGSupport.h"
#import "XSGGenerator+XSGOperators.h"
#import "XSGSubscriber.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, strong) XSGDisposable disposable;
@property (nonatomic, assign) NSInteger counter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testFlatMap];
}

- (void)testSubscribe {
    self.disposable = [self.button.xsg_generator subscribeWithValueHandler:^(id next) { NSLog(@"next -> %@", next); }];
}

- (void)testMap {
    self.disposable = [[self.button.xsg_generator
                        map:^id(id next) { return @[next, next]; }]
                        subscribeWithValueHandler:^(id next) { NSLog(@"next -> %@", next); }];
}

- (void)testFilter {
    self.disposable = [[[self.button.xsg_generator
                         map:^id _Nonnull(id _) { return @(arc4random_uniform(100)); }]
                         filter:^BOOL(id x) { return [x integerValue] > 50; }]
                         subscribeWithValueHandler:^(id x) { NSLog(@"next: %@", x); }];
}

- (void)testFlatMap {
    XSGCompletion.failure(NSError.new);
    self.disposable = [[self.button.xsg_generator
                        flatMap:^XSGGenerator * _Nonnull(id _) { return [self plusOneSignal]; }]
                        subscribeWithValueHandler:^(id x) { NSLog(@"flat next: %@", x); }
                        completionHandler:^(XSGCompletion *completion) { NSLog(@"flat map completed: %@", completion.error); }];
}

- (XSGGenerator *)plusOneSignal {
    return [XSGGenerator generatorWithEmitter:^XSGDisposable _Nullable(XSGSubscriber * _Nonnull subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber receiveValue:@(self.counter++)];
            [subscriber receiveCompletion:XSGCompletion.finished];
        });
        
        return nil;
    }];
}

@end


