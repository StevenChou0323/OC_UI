//
//  ViewController.m
//  MyRequestConnect
//
//  Created by 周建宏 on 2018/4/29.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"
#import "MyRequestManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyRequestManager *manager = [MyRequestManager sharedManager];
    manager.HTTPHeadersDic = @{@"apikey":@"c925fbc1226c37b905a4d1e2a8cbbe99"};
    [manager addRequestToManager:@"http://apis.baidu.com/showapi_open_bus/weather_showapi/areaid?area=%E5%8C%97%E4%BA%AC" finished:^(BOOL success, NSData *data) {
        if(success){
            NSLog(@"成功");
            NSString *dataStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",dataStr);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
