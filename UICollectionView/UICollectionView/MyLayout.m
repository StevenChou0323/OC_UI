//
//  MyLayout.m
//  UICollectionView
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
    _attributeArray = [[NSMutableArray alloc]init];

    float WIDTH = (UIScreen.mainScreen.bounds.size.width - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing) / 2;
    
    CGFloat colHigh[2] = {self.sectionInset.top,self.sectionInset.top};
    for(int i = 0; i<self.itemCount; i++){
        NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        CGFloat height = arc4random()%150+40;
        int width = 0;
        
        if(colHigh[0]<colHigh[1]){
            colHigh[0] = colHigh[0] + height + self.minimumLineSpacing;
            width = 0;
        }else{
            colHigh[1] = colHigh[1] + height + self.minimumLineSpacing;
            width = 1;
        }

        attris.frame = CGRectMake(self.sectionInset.left + (self.minimumInteritemSpacing+WIDTH)*width, colHigh[width] -height - self.minimumLineSpacing, WIDTH, height);
        
        NSLog(@"%f A1", WIDTH);
        NSLog(@"%f A2", height);
        
        [_attributeArray addObject:attris];
    }
    
    if(colHigh[0]>colHigh[1]){
        self.itemSize = CGSizeMake(WIDTH, (colHigh[0]- self.sectionInset.top)*2/_itemCount -self.minimumLineSpacing);
        
        NSLog(@"%f B1", WIDTH);
        NSLog(@"%f colHigh[0]",colHigh[0] );
           NSLog(@"%f (colHigh[0]- self.sectionInset.top)*2",(colHigh[0]- self.sectionInset.top)*2);
        NSLog(@"%f B2", (colHigh[0]- self.sectionInset.top)*2/_itemCount -self.minimumLineSpacing);
    }else{
         self.itemSize = CGSizeMake(WIDTH, colHigh[1] * 2/_itemCount - self.minimumLineSpacing);
        
        NSLog(@"%f C1", WIDTH);
        NSLog(@"%f colHigh[1]",colHigh[1] );
        NSLog(@"%f (colHigh[1]- self.sectionInset.top)*2",(colHigh[1]- self.sectionInset.top)*2);
        NSLog(@"%f C2",  (colHigh[1]- self.sectionInset.top)*2/_itemCount - self.minimumLineSpacing);
    }
    
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return _attributeArray;
}
@end
