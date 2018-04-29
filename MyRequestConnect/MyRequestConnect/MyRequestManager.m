//
//  MyRequestManager.m
//  MyRequestConnect
//
//  Created by 周建宏 on 2018/4/29.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "MyRequestManager.h"
#import "MyRequestConnection.h"
@implementation MyRequestManager
{
    NSMutableArray *_requestConnectionArray;
    
}
+(MyRequestManager *)sharedManager{
    static MyRequestManager *manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[MyRequestManager alloc]init];
    });
    return manager;
}

-(instancetype)init{
    self = [super init];
    if(self){
        _requestConnectionArray = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)addRequestToManager:(NSString *)urlStr finished:(void (^)(BOOL, NSData *))finish{
    for(MyRequestConnection *connection in _requestConnectionArray){
        if([connection.urlStr isEqualToString:urlStr]){
            return;
        }
    }
    MyRequestConnection *connection = [[MyRequestConnection alloc]init];
    if(self.HTTPHeadersDic){
        connection.HTTPHeadersDic = self.HTTPHeadersDic;
    }
    [_requestConnectionArray addObject:connection];
    [connection startRequestWithURLString:urlStr finished:^(BOOL success, NSData *data) {
        [_requestConnectionArray removeObject:connection];
        finish(success, data);
    }];
}

@end


