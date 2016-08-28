//
//  ZLPhotoCollectionView.m
//  ZLPhotoBrowser
//
//  Created by 张超 on 16/8/27.
//  Copyright © 2016年 long. All rights reserved.
//

#import "ZLPhotoCollectionView.h"
#import "ZLCollectionCell.h"
#import "ZLDefine.h"
#import "ZLPhotoActionSheet.h"
#import "ZLCollectionCell.h"


@interface ZLPhotoCollectionView() <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, assign)NSInteger number;

@property (nonatomic, strong) NSMutableArray  *arrDataSources;
@property (nonatomic, strong) NSMutableArray *lastSelectMoldels;

@property (nonatomic, strong) ZLPhotoCollectionView  *collectionView;

@property (nonatomic, strong) UIViewController  *vc;

@end

@implementation ZLPhotoCollectionView


+ (instancetype)photoCollectionViewFrame:(CGRect)frame andVC:(UIViewController *)vc {
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake((width-9)/4, (width-9)/4);
    
    layout.minimumInteritemSpacing = 1.5;
    
    layout.minimumLineSpacing = 1.5;
    
    layout.sectionInset = UIEdgeInsetsMake(3, 2, 3, 2);
    
    ZLPhotoCollectionView *photoView = [[ZLPhotoCollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    
    
    [photoView registerNib:[UINib nibWithNibName:@"ZLCollectionCell" bundle:kZLPhotoBrowserBundle] forCellWithReuseIdentifier:@"ZLCollectionCell"];
    
    photoView.number = 1;
    
    photoView.vc = vc;
    
    photoView.delegate = photoView;
//
    photoView.dataSource = photoView;
    
    photoView.collectionView = photoView;
    
    return photoView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _arrDataSources.count + self.number;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZLCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZLCollectionCell" forIndexPath:indexPath];
    
    
    if (indexPath.row == 0 && self.arrDataSources.count == 0) {
        //        cell.removeBtn.hidden = YES;
        cell.btnSelect.hidden = YES;
    }
    
    if (indexPath.row + 1 > self.arrDataSources.count) {//因为item有个占位的
        cell.imageView.image = [UIImage imageNamed:@"Snip20160821_2"];
        //        cell.removeBtn.hidden = YES;
        cell.btnSelect.hidden = YES;
        return cell;
    }else{
        if (self.arrDataSources.count == 0) {
            cell.imageView.image = [UIImage imageNamed:@"delete"];
            return cell;
        }else{
            
            cell.imageView.image = _arrDataSources[indexPath.row];
            cell.btnSelect.hidden = NO;
            [cell.btnSelect setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
            
            cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
            cell.btnSelect.tag = indexPath.row;
            [cell.btnSelect addTarget:self action:@selector(btnRmove:) forControlEvents:UIControlEventTouchUpInside];
            
        }
    }
    
    
    
    
    return cell;
}
- (void)btnRmove:(UIButton *)btn {
    
    [self.arrDataSources removeObjectAtIndex:btn.tag];
    
    NSLog(@"self.lastSelectMoldels:%@  btn.tag:%zd  ",self.lastSelectMoldels,btn.tag);
    [self.lastSelectMoldels removeObjectAtIndex:btn.tag];
    
    
    [self.collectionView reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    ZLCollectionCell *cell = (ZLCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //    [ZLShowBigImage showBigImage:cell.imageView];
    ZLPhotoActionSheet *actionSheet = [[ZLPhotoActionSheet alloc] init];
    //设置照片最大选择数
    actionSheet.maxSelectCount = 5;
    //设置照片最大预览数
    actionSheet.maxPreviewCount = 20;
    
    weakify(self);
    [actionSheet showWithSender:self.vc animate:YES lastSelectPhotoModels:self.lastSelectMoldels completion:^(NSMutableArray<UIImage *> * _Nonnull selectPhotos, NSMutableArray<ZLSelectPhotoModel *> * _Nonnull selectPhotoModels) {
        strongify(weakSelf);
        strongSelf.arrDataSources = selectPhotos;
        
        strongSelf.lastSelectMoldels = selectPhotoModels;
        NSLog(@"lastSelectMoldels:%@  selectPhotoModels:%@",strongSelf.lastSelectMoldels,selectPhotoModels);
        [strongSelf reloadData];
        NSLog(@"%@", selectPhotos);
    }];
    
}


@end
