//
//  ViewController.m
//  UIScrollView
//
//  Created by 周建宏 on 2018/4/2.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 50, 300, 500)];
    imageView.image = [UIImage imageNamed:@"test"];
    [scrollView addSubview:imageView];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width*2, self.view.frame.size.height*2);
    [self.view addSubview:scrollView];
    
    scrollView.bounces = YES;
    scrollView.alwaysBounceVertical = NO;
    scrollView.alwaysBounceHorizontal = YES;
   // [scrollView setPagingEnabled:NO];
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    scrollView.scrollsToTop = YES;
    scrollView.delegate = self;
    
    scrollView.minimumZoomScale = 0.5;
    scrollView.maximumZoomScale = 3;
    scrollView.bouncesZoom = YES;
    // Do any additional setup after loading the view, typically from a nib.
}

-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    NSLog(@"scrollViewShouldScrollToTop");
    return true;
}
-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScrollToTop");
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
   // NSLog(@"scrollViewDidScroll");
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return scrollView.subviews.firstObject;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
