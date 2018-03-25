//
//  ViewController.m
//  CALayer
//
//  Created by 周建宏 on 2018/3/25.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 50, 50);
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = 25;
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    btn.layer.shadowColor = [UIColor yellowColor].CGColor;
    btn.layer.shadowOffset = CGSizeMake(10, 20);
    btn.layer.shadowOpacity = 1;
    btn.layer.borderWidth = 3;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
