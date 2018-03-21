//
//  ViewController.m
//  UIButton
//
//  Created by 周建宏 on 2018/3/20.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 30, 100, 200);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"Click" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeColor) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
//    [button setBackgroundImage:[UIImage imageNamed:@"btn" ] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:@"btn" ] forState:UIControlStateNormal];
}

- (void)changeColor {
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
