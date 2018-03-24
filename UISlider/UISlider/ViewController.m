//
//  ViewController.m
//  UISlider
//
//  Created by 周建宏 on 2018/3/23.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(10, 20, 200, 20)];
    slider.continuous = NO;
    slider.maximumValue = 100;
    slider.minimumValue = 0;
    slider.value = 5;
    slider.maximumTrackTintColor = [UIColor redColor];
    slider.minimumTrackTintColor = [UIColor blueColor];
    //slider.thumbTintColor = [UIColor greenColor];
    [slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    //slider.minimumValueImage = [UIImage imageNamed:@"Melon"];
    //slider.maximumValueImage = [UIImage imageNamed:@"Plaster"];
    [slider setThumbImage:[UIImage imageNamed:@"controller"] forState:UIControlStateHighlighted];
    [slider setThumbImage:[UIImage imageNamed:@"controller"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)changeValue:(UISlider *)slider{
    NSLog(@"%f", slider.value);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
