//
//  RegisViewController.m
//  LoginView
//
//  Created by 周建宏 on 2018/3/27.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "RegisViewController.h"

@interface RegisViewController ()

@end

@implementation RegisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 50,SCREEN_SIZE.width - 100, 60)];
    label.font = [UIFont systemFontOfSize:25];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"介面";
    [self.view addSubview:label];
    
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(SCREEN_SIZE.width / 2 - 50, 140, 100, 40);
    btn.backgroundColor = [UIColor whiteColor];
    btn.layer.cornerRadius = 10;
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(retu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}

-(void)retu{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
