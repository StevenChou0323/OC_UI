//
//  ViewController.m
//  UISwitch
//
//  Created by 周建宏 on 2018/3/22.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwitch *swi = [[UISwitch alloc]initWithFrame:CGRectMake(10, 20, 40, 30)];
    swi.onTintColor = [UIColor redColor];
    swi.tintColor = [UIColor greenColor];
    swi.thumbTintColor = [UIColor blackColor];
    [self.view addSubview:swi];
    
    [swi addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)changeColor:(UISwitch*)swi{
    if(swi.isOn){
        self.view.backgroundColor = [UIColor blackColor];
    }else{
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
