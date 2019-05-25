//
//  MyPhoneCollectionV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyPhoneCollectionV.h"
#import "MyphoeCell.h"
@implementation MyPhoneCollectionV

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 15, 0, 15);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.Data.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize Size ;
    Size =  CGSizeMake(([UIScreen mainScreen].bounds.size.width - 40) / 3,([UIScreen mainScreen].bounds.size.width - 40) / 3);
    return Size;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ClassName;
    ClassName = @"banner";
    return [self setupCollectionView:collectionView indexPath:indexPath CellName:ClassName data:self.Data[indexPath.row]];
}




- (void)configCellXIB {
    self.backgroundColor = Col_F6F;
    self.LineSpace = 10;
    [self registerClass:[MyphoeCell class] forCellWithReuseIdentifier:@"banner"];
}


@end
