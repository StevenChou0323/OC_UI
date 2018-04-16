//
//  ViewController.m
//  UINavigationController
//
//  Created by 周建宏 on 2018/3/31.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

int conIndex = 1;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = [NSString stringWithFormat:@"第%d個controller",conIndex];
    conIndex++;
    
    //button
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(120, 200, 100, 20);
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //navigationController
    self.navigationController.navigationBar.tintColor = [UIColor purpleColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"test"] forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *btnItem1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(click)];
    UIBarButtonItem *btnItem2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(click)];
    UIBarButtonItem *btnItem3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(click)];

    //https://blog.csdn.net/icash/article/details/50666844
    //btnItem5因為圖片大小不對,造成無法顯示,解決方法可用btnItem6方式
    UIBarButtonItem *btnItem5 = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"test"] style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    
    UIImage *aimage = [UIImage imageNamed:@"test"];
    UIImage *image = [aimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *btnItem6 = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    
    
    UIBarButtonItem *btnItem7 = [[UIBarButtonItem alloc]initWithTitle:@"標題" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    self.navigationItem.leftBarButtonItems = @[btnItem6,btnItem7];
    
    //toolbar
    self.navigationController.toolbarHidden = NO;
    self.navigationController.toolbar.barTintColor = [UIColor redColor];
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(click)];
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(click)];
    UIBarButtonItem *btn3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(click)];
    UIBarButtonItem *btn4 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(click)];
    UIBarButtonItem *btn5 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(click)];
    self.toolbarItems = @[btn1,btn2,btn3,btn4,btn5];
    
//    self.navigationController.hidesBarsOnTap = YES;
//    self.navigationController.hidesBarsOnSwipe = YES;
}

-(void)click{
    NSLog(@"HI");
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)btnTouched{
    ViewController *con = [[ViewController alloc]init];
    con.title =[NSString stringWithFormat:@"第%dcontroller",conIndex];
   [self.navigationController pushViewController:con animated:YES];
}
-(void)dealloc{
    conIndex--;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
