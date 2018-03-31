//
//  ViewController.m
//  UISearchBar
//
//  Created by 周建宏 on 2018/3/26.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UISearchBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(100, 20, 200, 40)];
    searchBar.tintColor = [UIColor redColor];
    searchBar.placeholder = @"typing...";
    searchBar.showsScopeBar = true;
    searchBar.showsCancelButton = true;
   // searchBar.showsBookmarkButton = true;
    searchBar.showsSearchResultsButton = true;
//    [searchBar setScopeButtonTitles:@[@"one",@"two",@"three"]];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    NSLog(@"%@", searchBar.text);
}
-(void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"bookmark");
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"cancel");
}
-(void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"search");
}
-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope{
    NSLog(@"%lo", selectedScope);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
