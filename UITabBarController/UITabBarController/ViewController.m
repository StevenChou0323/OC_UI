//
//  ViewController.m
//  UITabBarController
//
//  Created by 周建宏 on 2018/4/1.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for(int i = 0; i < 10; i++){
        UIViewController *con = [[UIViewController alloc]init];
        con.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];

        UIImage *musicImage = [UIImage imageNamed:@"selected"];
        UIImage *musicImageSel = [UIImage imageNamed:@"selection"];
        
        musicImage = [musicImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        musicImageSel = [musicImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        //method 1: init tabBarItem 一個一個
//        con.tabBarItem.image = musicImage;
//        con.tabBarItem.selectedImage = musicImageSel;
//        con.tabBarItem.title = [NSString stringWithFormat:@"%d個",i];
       
       //method 2: 一次設定好tabBarItem
//        con.tabBarItem = [[UITabBarItem alloc]initWithTitle:[NSString stringWithFormat:@"%d個個",i] image:musicImage selectedImage:musicImageSel];
    
//        con.tabBarItem = [[UITabBarItem alloc]initWithTitle:[NSString stringWithFormat:@"%d個個個",i] image:musicImage tag:i];
        
        int style = UITabBarSystemItemMore;
        if(i == 0){
            style = UITabBarSystemItemFavorites;
        }else if(i == 1){
            style = UITabBarSystemItemFeatured;
        }else if(i == 2){
            style = UITabBarSystemItemTopRated;
        }else if(i == 3){
            style = UITabBarSystemItemRecents;
        }else if(i == 4){
            style = UITabBarSystemItemContacts;
        }else if(i == 5){
            style = UITabBarSystemItemHistory;
        }
        con.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:style tag:i];
         
        [array addObject:con];
    }
    
    tabBar.viewControllers = array;
    [self presentViewController:tabBar animated:YES completion:nil];
    
    tabBar.tabBar.barTintColor = [UIColor blackColor];
    tabBar.tabBar.tintColor = [UIColor redColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
