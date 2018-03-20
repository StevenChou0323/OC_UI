//
//  ViewController.m
//  UILabel
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
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 200, 300)];
    label.text = @"Do any additional setup after loading the view, typically from a nib";
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor redColor];
    label.font = [UIFont boldSystemFontOfSize:25];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:label];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
