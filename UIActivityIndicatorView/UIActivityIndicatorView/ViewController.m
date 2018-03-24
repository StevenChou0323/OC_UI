//
//  ViewController.m
//  UIActivityIndicatorView
//
//  Created by 周建宏 on 2018/3/23.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
UIActivityIndicatorView *indicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.color = [UIColor yellowColor];
    indicator.center = CGPointMake(self.view.frame.size.width /2, self.view.frame.size.height /2);
    [self.view addSubview:indicator];
    self.view.backgroundColor = [UIColor redColor];
    [indicator startAnimating];
    indicator.hidesWhenStopped = false;
    
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(indicator.frame.origin.x + 100, indicator.frame.origin.y + 100, 30, 20);
    [button setTitle:@"btn" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(changeAni) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)changeAni{
    if(indicator.isAnimating == YES){
         [indicator stopAnimating];
    }else{
         [indicator startAnimating];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
