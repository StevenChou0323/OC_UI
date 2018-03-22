//
//  ViewController.m
//  UITextField
//
//  Created by 周建宏 on 2018/3/22.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 20, 200, 100)];
    textField.borderStyle = UITextBorderStyleBezel;
    textField.placeholder = @"please enter something";
    [self.view addSubview:textField];
    textField.textColor = [UIColor blueColor];
    textField.font = [UIFont systemFontOfSize:12];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btn2" ]];
    textField.rightView = imageView;
    textField.rightViewMode = UITextFieldViewModeAlways;
    textField.delegate = self;
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(string.length>0){
        if([string characterAtIndex:0]<'0'||[string characterAtIndex:0]>'9'){
            NSLog(@"please enter num");
            return NO;
        }
        if(textField.text.length+string.length>11){
            NSLog(@"enter under 11 nums");
            return NO;
        }
    
        return YES;
    }
    
    return NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
