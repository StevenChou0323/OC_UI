//
//  ViewController.m
//  UIStepper
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
    UIStepper *stepper = [[UIStepper alloc]init];
    stepper.center = CGPointMake(100, 200);
    stepper.minimumValue = 0;
    stepper.maximumValue = 100;
    stepper.wraps = NO;
    stepper.continuous = YES;
    stepper.autorepeat = NO;
    stepper.stepValue = 1;
    [stepper addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    
    UIImage *img = [UIImage imageNamed:@"cal"];
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [stepper setDecrementImage:img forState:UIControlStateNormal];
    
    UIImage *imgDow = [UIImage imageNamed:@"dow"];
    imgDow = [imgDow imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [stepper setIncrementImage:imgDow forState:UIControlStateNormal];
    
    [self.view addSubview:stepper];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)changeValue:(UIStepper *)step{
    NSLog(@"%f", step.value);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
