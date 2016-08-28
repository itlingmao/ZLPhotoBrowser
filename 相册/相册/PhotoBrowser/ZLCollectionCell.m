//
//  ZLCollectionCell.m
//  多选相册照片
//
//  Created by long on 15/11/25.
//  Copyright © 2015年 long. All rights reserved.
//

#import "ZLCollectionCell.h"

@implementation ZLCollectionCell

- (void)awakeFromNib {
    // Initialization code
}

//+ (instancetype)collectionCell:(UICollectionView *)collection andIndexPath:(NSIndexPath *)indexPath andArrDataSources:(NSArray *)arrDataSources{
//    
//    ZLCollectionCell *cell = [collection dequeueReusableCellWithReuseIdentifier:@"ZLCollectionCell" forIndexPath: indexPath];
//    
//    [cell.btnSelect setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
//    cell.imageView.image = arrDataSources[indexPath.row];
//    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
//    cell.btnSelect.tag = indexPath.row;
//    [cell.btnSelect addTarget:self action:@selector(btnRmove:) forControlEvents:UIControlEventTouchUpInside];
//    
//    return cell;
//}
//
//- (void)btnRmove:(UIButton *)btn {
//    
//    [self.arrDataSources removeObjectAtIndex:btn.tag];
//    
//    NSLog(@"self.lastSelectMoldels:%@  btn.tag:%zd  ",self.lastSelectMoldels,btn.tag);
//    [self.lastSelectMoldels removeObjectAtIndex:btn.tag];
//    
//    
//    [self.collectionView reloadData];
//}

@end
