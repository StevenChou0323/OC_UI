//
//  ViewController.m
//  UIDatePicker
//
//  Created by 周建宏 on 2018/3/26.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(10, 100, 300, 150)];
//    datePicker.datePickerMode = UIDatePickerModeDate;
 //   datePicker.datePickerMode = UIDatePickerModeTime;
 //   datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    [datePicker addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)change:(UIDatePicker *)picker{
    NSLog(@"%@",picker.date);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
