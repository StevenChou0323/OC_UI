//
//  ViewController.m
//  LoginView
//
//  Created by 周建宏 on 2018/3/27.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"
#import "RegisViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //login
    _loginText = [[UITextField alloc]initWithFrame:CGRectMake(20, 40, SCREEN_SIZE.width - 30 , 30)];
    _loginText.borderStyle = UITextBorderStyleBezel;
    _loginText.placeholder = @"typing...";
    UIImageView *loginImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    loginImage.image = [UIImage imageNamed:@"login"];
    _loginText.leftViewMode = UITextFieldViewModeAlways;
    _loginText.leftView = loginImage;
    [self.view addSubview:_loginText];

    //password
    _passwordText = [[UITextField alloc]initWithFrame:CGRectMake(20, 100, SCREEN_SIZE.width - 30 , 30)];
    _passwordText.borderStyle = UITextBorderStyleBezel;
    UIImageView *passwordImge = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    passwordImge.image = [UIImage imageNamed:@"password"];
    _passwordText.leftViewMode = UITextFieldViewModeAlways;
    _passwordText.leftView = passwordImge;
    _passwordText.secureTextEntry = true;
    [self.view addSubview:_passwordText];
    
    //button 登入
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(SCREEN_SIZE.width / 4  - 50, 150, 100, 20);
    [btn setTitle:@"登入" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //button 註冊
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(SCREEN_SIZE.width / 4 * 3  - 50, 150, 100, 20);
    [btn2 setTitle:@"註冊" forState:UIControlStateNormal];
    btn2.layer.cornerRadius = 10;
    btn2.layer.masksToBounds = YES;
    btn2.backgroundColor = [UIColor redColor];
    [btn2 addTarget:self action:@selector(regis) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}

-(void)login{
    if(_loginText.text.length == 0){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"無輸入帳號" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        return;
    }
    
    if(_passwordText.text.length == 0){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"無輸入密碼" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        return;
    }
}

-(void)regis{
    RegisViewController *con = [[RegisViewController alloc]init];
    [self presentViewController:con animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
