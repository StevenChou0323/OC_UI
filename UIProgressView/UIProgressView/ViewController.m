//
//  ViewController.m
//  UIProgressView
//
//  Created by 周建宏 on 2018/3/24.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIProgressView *progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(10, 20, 300, 20)];
    progressView.progressTintColor  =[UIColor redColor];
    progressView.trackTintColor = [UIColor blueColor];
    [self.view addSubview:progressView];
    progressView.progress = 0.3;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
