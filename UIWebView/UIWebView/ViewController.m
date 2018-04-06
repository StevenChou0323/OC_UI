//
//  ViewController.m
//  UIWebView
//
//  Created by 周建宏 on 2018/4/2.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    NSURL *url = [NSURL URLWithString:@"http://www.google.com.tw"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
    
   NSString *htmlStr = @"<html><head><meta charset=\"UTF-8\"><title>主標題</title></head><body><p>hello world</body></html>";
//    [webView loadHTMLString:htmlStr baseURL:nil];
    
    //https://github.com/react-native-community/react-native-video/issues/1
    //make sure that it's in XCode and in the Build Phases > Copy Bundle Resources list
   NSURL *imageUrl = [[NSURL alloc]initFileURLWithPath:[[NSBundle mainBundle]pathForResource:@"image" ofType:@"png"]];
    
    NSData *data = [NSData dataWithContentsOfURL:imageUrl];
    [webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    

    [self.view addSubview:webView];
    
    webView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"shouldStartLoadWithRequest");
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"webViewDidStartLoad");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webViewDidFinishLoad");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
