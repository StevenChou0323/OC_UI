//
//  ViewController.m
//  UISegmentedControl
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
    UIImage* img = [UIImage imageNamed:@"high"];
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"one",@"two",@""]];
    [seg setImage:img forSegmentAtIndex:2];
    seg.frame = CGRectMake(50, 40, 250, 50);
    seg.momentary = NO;
    [self.view addSubview:seg];
    [seg insertSegmentWithTitle:@"four equals last one" atIndex:3 animated:NO];
    seg.apportionsSegmentWidthsByContent = YES;
    [seg addTarget:self action:@selector(changeBack:) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)changeBack:(UISegmentedControl *)seg{
    if(seg.selectedSegmentIndex == 0){
       [seg removeAllSegments];
    }
    else if(seg.selectedSegmentIndex == 1){
        self.view.backgroundColor = [UIColor redColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
