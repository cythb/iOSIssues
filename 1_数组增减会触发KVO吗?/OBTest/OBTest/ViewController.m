//
//  ViewController.m
//  OBTest
//
//  Created by tanghaibo on 16/2/16.
//  Copyright © 2016年 tanghaibo. All rights reserved.
//

#import "ViewController.h"

@interface Foo : NSObject

@property (nonatomic, strong) NSString *name;
@end

@implementation Foo

@end

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation ViewController

- (void)observeArray {
    [self addObserver:self forKeyPath:@"array" options:0 context:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        Foo *f = [Foo new];
        f.name = @"1";
        [self.array addObject:f];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.array removeLastObject];
    });
}

- (void)observeArrayNotSupport {
    [self.array addObserver:self forKeyPath:@"name" options:0 context:nil];
    Foo *f = [Foo new];
    f.name = @"1";
    [self.array addObject:f];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        f.name = @"a";
    });
}

- (void)observeItemOfArray {
    
    Foo *f = [Foo new];
    f.name = @"1";
    [self.array addObject:f];
    [self.array addObserver:self toObjectsAtIndexes:[NSIndexSet indexSetWithIndex:0] forKeyPath:@"name" options:0 context:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        f.name = @"a";
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = [NSMutableArray array];
    
    // 可以打开注释分别测试
    //    [self observeArray];
    //    [self observeArrayNotSupport];
    //    [self observeItemOfArray];
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSString*, id> *)change context:(nullable void *)context {
    NSLog(@"%@", [object name]); // output: a
}

@end
