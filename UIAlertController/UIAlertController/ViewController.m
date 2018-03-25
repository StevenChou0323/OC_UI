//
//  ViewController.m
//  UIAlertController
//
//  Created by 周建宏 on 2018/3/25.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"恭喜" message:@"獲得" preferredStyle:UIAlertControllerStyleAlert ];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"按鈕" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Click");
    }];

    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"注意" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"注意");
    }];
    

    [alert addAction:action2];
    [alert addAction:action3];
    [alert addAction:action1];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"place";
        textField.delegate  = self;
    }];

    [self presentViewController:alert animated:YES completion:nil];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"this is you typed %@",textField.text);
}

//
//-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"標題" message:@"結束" preferredStyle:UIAlertControllerStyleActionSheet];
//    
//    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"one" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"one");
//    }];
//    
//    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"two" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"two");
//    }];
//    
//    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"three" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"three");
//    }];
//    
//    [actionSheet addAction:action1];
//    [actionSheet addAction:action2];
//    [actionSheet addAction:action3];
//    [self presentViewController:actionSheet animated:YES completion:nil];
//    
//}
@end
