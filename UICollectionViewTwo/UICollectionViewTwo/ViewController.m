//
//  ViewController.m
//  UICollectionViewTwo
//
//  Created by 周建宏 on 2018/4/8.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyLayout *layout  = [[MyLayout alloc]init];
    UICollectionView *collect = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 30, 320, 400) collectionViewLayout:layout];
    collect.delegate = self;
    collect.dataSource  = self;
    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:collect];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.layer.cornerRadius = 25;
    cell.layer.masksToBounds  = YES;
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0  alpha:1];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
