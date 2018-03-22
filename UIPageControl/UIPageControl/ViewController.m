//
//  ViewController.m
//  UIPageControl
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
    self.view.backgroundColor = [UIColor blueColor];
    UIPageControl  *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(50, 200, 300, 20)];
    pageControl.currentPageIndicatorTintColor  = [UIColor blackColor];
//    pageControl.currentPage  = 2;
    pageControl.numberOfPages = 5;
    [pageControl addTarget:self action:@selector(changeNum:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)changeNum:(UIPageControl*)page{
    NSLog(@"%lu", page.currentPage);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
