//
//  MyRequestManager.h
//  MyRequestConnect
//
//  Created by 周建宏 on 2018/4/29.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyRequestManager : NSObject
+(MyRequestManager *)sharedManager;
-(void) addRequestToManager:(NSString *)urlStr finished:(void(^)(BOOL success, NSData *data))finish;
@property(nonatomic,strong)NSDictionary *HTTPHeadersDic;
@end
