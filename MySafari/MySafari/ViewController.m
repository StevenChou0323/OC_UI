//
//  ViewController.m
//  MySafari
//
//  Created by 周建宏 on 2018/4/9.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"
#import "HistoryTableViewController.h"
#import "LikeTableViewController.h"

@interface ViewController ()<UIWebViewDelegate, UIGestureRecognizerDelegate>
{
    UIWebView *_webView;
    UITextField *_searchBar;
    BOOL _isUp;
    UILabel *_titleLabel;
    UISwipeGestureRecognizer *_upSwipe;
    UISwipeGestureRecognizer *_downSwipe;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    _webView.scrollView.bounces = NO;
    _webView.delegate = self;
    _isUp = NO;
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 40, 20)];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.google.com.tw"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
    [self.view addSubview:_titleLabel];
    
    [self createSearchBar];
    
    [self createGesture];
    
   [self createToolBar];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)createSearchBar{
    _searchBar = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 40, 30)];
    _searchBar.borderStyle = UITextBorderStyleRoundedRect;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn addTarget:self action:@selector(goWeb) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 50, 30);
    [btn setTitle:@"前往" forState:UIControlStateNormal];
    _searchBar.rightView = btn;
    _searchBar.rightViewMode = UITextFieldViewModeAlways;
    _searchBar.placeholder = @"enter url...";
    self.navigationItem.titleView = _searchBar;

}
-(void)goWeb{
    if(_searchBar.text.length>0){
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@",_searchBar.text]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"不能為空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
   
        [self presentViewController:alert animated:YES completion:nil];
    }
}
-(void)createGesture{
    _upSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(upSwipe)];
    _upSwipe.delegate = self;
    _upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    [_webView addGestureRecognizer:_upSwipe];
    
    _downSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(downSwipe)];
    _downSwipe.delegate = self;
    _downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    [_webView addGestureRecognizer:_downSwipe];
}

-(void)upSwipe{
     NSLog(@"upSwipe %f",_webView.scrollView.contentOffset.y );
    if(_isUp){
        return;
    }
     NSLog(@"upSwipe2");
    self.navigationItem.titleView = nil;
    _webView.frame = CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height - 40);
    [UIView animateWithDuration:0.3 animations:^{
        self.navigationController.navigationBar.frame = CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.width, 40);
        [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:7 forBarMetrics:UIBarMetricsDefault];
    } completion:^(BOOL finished) {
        self.navigationItem.titleView = _titleLabel;
    }];
    [self.navigationController setToolbarHidden:YES animated:YES];
    _isUp = YES;
}

-(void)downSwipe{
    NSLog(@"downSwipe %f",_webView.scrollView.contentOffset.y );
    if(_webView.scrollView.contentOffset.y <= 0 && _isUp){
         NSLog(@"downSwipe2");
        self.navigationItem.titleView = nil;
        _webView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
        [UIView animateWithDuration:0.3 animations:^{
            self.navigationController.navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
            [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];
        } completion:^(BOOL finished) {
            self.navigationItem.titleView = _searchBar;
        }];
        [self.navigationController setToolbarHidden:NO animated:YES];
        _isUp = NO;

    }
}

-(void)createToolBar{
    self.navigationController.toolbarHidden = NO;
    UIBarButtonItem *itemHistory = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(goHistory)];
    UIBarButtonItem *itemLike = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(goLike)];
    UIBarButtonItem *itemBack = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    UIBarButtonItem *itemForward = [[UIBarButtonItem alloc]initWithTitle:@"forward" style:UIBarButtonItemStylePlain target:self action:@selector(goForward)];
    UIBarButtonItem *itemEmpty1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *itemEmpty2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
   UIBarButtonItem *itemEmpty3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.toolbarItems = @[itemHistory,itemEmpty1,itemLike,itemEmpty2,itemBack,itemEmpty3,itemForward];
}

-(void)goHistory{
    HistoryTableViewController *controller = [[HistoryTableViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)goLike{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"選擇" preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"增加" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSArray *array = [[NSUserDefaults standardUserDefaults]valueForKey:@"Like"];
        if(!array){
            array = [[NSArray alloc]init];
        }
        NSMutableArray *newArray = [[NSMutableArray alloc]initWithArray:array];
        [newArray addObject:_webView.request.URL.absoluteString];
        [[NSUserDefaults standardUserDefaults]setValue:newArray forKey:@"Like"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"查看" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        LikeTableViewController *controller = [[LikeTableViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil
    ];
    [alert addAction:action];
    [alert addAction:action2];
    [alert addAction:action3];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)goBack{
    if([_webView canGoBack]){
        [_webView goBack];
    }
}

-(void)goForward{
    if([_webView canGoForward]){
        [_webView goForward];
    }
}

-(void)loadURL:(NSString *)urlStr{
    NSURL *url  = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStr]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if(gestureRecognizer == _upSwipe || gestureRecognizer == _downSwipe){
        return YES;
    }
    return NO;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    _titleLabel.text = _webView.request.URL.absoluteString;
    NSArray *array = [[NSUserDefaults standardUserDefaults]valueForKey:@"History"];
    if(!array){
        array = [[NSArray alloc]init];
    }
    NSMutableArray *newArray = [[NSMutableArray alloc]initWithArray:array];
    [newArray addObject:_titleLabel.text];
    [[NSUserDefaults standardUserDefaults]setValue:newArray forKey:@"History"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
