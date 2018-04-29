//
//  ViewController.m
//  NSURLConnection
//
//  Created by 周建宏 on 2018/4/16.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>
{
    NSMutableData *_data;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSURL *url = [NSURL URLWithString:@"http://apis.baidu.com/showapi_open_bus/weather_showapi/areaid?area=%E5%8C%97%E4%BA%AC"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setValue:@"c925fbc1226c37b905a4d1e2a8cbbe99" forHTTPHeaderField:@"apikey"];
    //同步
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    NSString *dataStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",dataStr);
//    NSLog(@"進行同步");
    //異步
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//         NSString *dataStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"%@",dataStr);
//    }];
 //   NSLog(@"進行異步");
  
     NSURL *url = [NSURL URLWithString:@"http://apis.baidu.com/showapi_open_bus/weather_showapi/areaid?area=%E5%8C%97%E4%BA%AC"];
     NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
     [request setValue:@"c925fbc1226c37b905a4d1e2a8cbbe99" forHTTPHeaderField:@"apikey"];
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
     NSLog(@"data ing");
    [_data appendData:data];
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"開始收data");
    _data = [[NSMutableData alloc]init];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"data收到");
    NSString *dataStr = [[NSString alloc]initWithData:_data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", dataStr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
