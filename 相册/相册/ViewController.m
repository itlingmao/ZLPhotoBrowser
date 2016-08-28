//
//  ViewController.m
//  相册
//
//  Created by 张超 on 16/8/28.
//  Copyright © 2016年 张超. All rights reserved.
//

#import "ViewController.h"
#import "ZLPhotoCollectionView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpuI];
}

- (void)setUpuI {
    
    ZLPhotoCollectionView *photo = [ZLPhotoCollectionView photoCollectionViewFrame:CGRectMake(0, 300,[UIScreen mainScreen].bounds.size.width , 100) andVC:self];
    
    [self.view addSubview:photo];
}

@end
