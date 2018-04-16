//
//  MyLayout.m
//  UICollectionViewTwo
//
//  Created by 周建宏 on 2018/4/8.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "MyLayout.h"

@implementation MyLayout
{
    NSMutableArray *_attributeArray;
}

-(void)prepareLayout{
    [super prepareLayout];
    _itemCount = (int)[self.collectionView numberOfItemsInSection:0];
    _attributeArray = [[NSMutableArray alloc]init];
    CGFloat radius = MIN(self.collectionView.frame.size.width, self.collectionView.frame.size.height) / 2;
    CGPoint center = CGPointMake(self.collectionView.frame.size.width / 2, self.collectionView.frame.size.height / 2);
    for(int i = 0 ; i < _itemCount ; i++){
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        attris.size = CGSizeMake(50, 50);
        float x = center.x + cosf(2*M_PI/_itemCount*i)*(radius);
        NSLog(@"%d AA",_itemCount*i);
           NSLog(@"%f BB",2*M_PI/_itemCount*i);
        float y = center.y + sinf(2*M_PI/_itemCount*i)*(radius);
        NSLog(@"%f CC",cosf(2*M_PI/_itemCount*i));
        attris.center = CGPointMake(x, y);
        [_attributeArray addObject:attris];
    }
    
}
-(CGSize)collectionViewContentSize{
    return self.collectionView.frame.size;
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return _attributeArray;
}
@end
