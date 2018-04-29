//
//  MyRequestConnection.m
//  MyRequestConnect
//
//  Created by 周建宏 on 2018/4/29.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "MyRequestConnection.h"

@implementation MyRequestConnection
-(void)startRequestWithURLString:(NSString *)urlStr finished:(void (^)(BOOL, NSData *))finish{
    self.urlStr = urlStr;
    NSURL *url  = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    if(self.HTTPHeadersDic){
        for(NSString *key in self.HTTPHeadersDic.allKeys){
            [request setValue:[self.HTTPHeadersDic objectForKey:key] forHTTPHeaderField:key];
        }
    }
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if(connectionError == nil){
            finish(YES,data);
        }else{
            NSLog(@"網路出錯");
            finish(NO,data);
        }
    }];
    
    
}
@end
