//
//  ZLPhotoCollectionView.h
//  ZLPhotoBrowser
//
//  Created by 张超 on 16/8/27.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLPhotoCollectionView : UICollectionView


///frame: 设置大小 vc: 设置那个控制器
+ (instancetype)photoCollectionViewFrame:(CGRect)frame andVC:(UIViewController *)vc;

@end
