//
//  ViewController.m
//  UICollectionView
//
//  Created by 周建宏 on 2018/4/7.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    layout.itemSize = CGSizeMake(100, 100);
//    layout.minimumLineSpacing = 30;
//    layout.minimumInteritemSpacing = 10;
//    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
//    collectionView.backgroundColor = [UIColor clearColor];
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
//    [self.view addSubview:collectionView];
//    collectionView.delegate = self;
//    collectionView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    MyLayout *layout = [[MyLayout alloc]init];
    layout.itemCount = 20;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor  = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    [self.view addSubview:collectionView];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    if(indexPath.row == 0){
        cell.backgroundColor = [UIColor greenColor];
    }
    if(indexPath.row == 1){
         cell.backgroundColor = [UIColor yellowColor];
    }
    if(indexPath.row == 2){
        cell.backgroundColor = [UIColor purpleColor];
    }
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}


//- (CGSize)collectionView:(UICollectionView *)collectionView
//                  layout:(UICollectionViewLayout *)collectionViewLayout
//  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if(indexPath.row %2 == 0){
//        return CGSizeMake(40, 40);
//    }else{
//         return CGSizeMake(100, 100);
//    }
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
