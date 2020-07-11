//
//  ViewController.m
//  UIReelCollectionView
//
//  Created by Han Mingjie on 2020/7/11.
//  Copyright © 2020 MingJie Han. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "UIReelCollectionViewFlowLayout.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    UIReelCollectionViewFlowLayout *collectionReelLayout;
    UICollectionView *myCollectionView;
    NSMutableArray * colorArray;
    UILabel *scale_value_label;
    UISlider *scale_slider;
    
    UILabel *rotate_value_label;
    UISlider *rotate_slider;
}

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Reel CollectionView Demo";
    colorArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 50; i ++) {
        int R = (arc4random() % 256);
        int G = (arc4random() % 256);
        int B = (arc4random() % 256) ;
        NSDictionary *dic = @{@"color":[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1]};
        [colorArray addObject:dic];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (nil == myCollectionView){
        collectionReelLayout = [[UIReelCollectionViewFlowLayout alloc] init];
        collectionReelLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        collectionReelLayout.itemSize = CGSizeMake(61.8 * 2, 200);
        
        myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 30.f, self.view.frame.size.width, 400.f) collectionViewLayout:collectionReelLayout];
        myCollectionView.backgroundColor = [UIColor whiteColor];
        [myCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        myCollectionView.dataSource = self;
        myCollectionView.delegate = self;
        myCollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        [self.view addSubview:myCollectionView];
    }
    
    if (nil == scale_slider){
        scale_slider = [[UISlider alloc] initWithFrame:CGRectMake(10.f, self.view.frame.size.height-60.f, self.view.frame.size.width-20.f, 20.f)];
        scale_slider.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
        scale_slider.minimumValue = 0.1;
        scale_slider.maximumValue = 2.f;
        scale_slider.value = collectionReelLayout.scale_coefficient;
        [scale_slider addTarget:self action:@selector(scale_slider_changed) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:scale_slider];
    }
    if (nil == scale_value_label){
        scale_value_label = [[UILabel alloc] initWithFrame:scale_slider.frame];
        scale_value_label.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
        scale_value_label.textAlignment = NSTextAlignmentCenter;
        scale_value_label.backgroundColor = [UIColor clearColor];
        scale_value_label.text = [NSString stringWithFormat:@"Scale:%.1f",scale_slider.value];
        [self.view addSubview:scale_value_label];
    }
    if (nil == rotate_slider){
        rotate_slider = [[UISlider alloc] initWithFrame:CGRectMake(10.f, self.view.frame.size.height-90.f, self.view.frame.size.width-20.f, 20.f)];
        rotate_slider.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
        rotate_slider.minimumValue = 0.1;
        rotate_slider.maximumValue = 2.f;
        rotate_slider.value = collectionReelLayout.rotate_coefficient;
        [rotate_slider addTarget:self action:@selector(rotate_slider_changed) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:rotate_slider];
    }
    if (nil == rotate_value_label){
        rotate_value_label = [[UILabel alloc] initWithFrame:rotate_slider.frame];
        rotate_value_label.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
        rotate_value_label.textAlignment = NSTextAlignmentCenter;
        rotate_value_label.backgroundColor = [UIColor clearColor];
        rotate_value_label.text = [NSString stringWithFormat:@"Rotate:%.1f",rotate_slider.value];
        [self.view addSubview:rotate_value_label];
    }
}


-(void)rotate_slider_changed{
    collectionReelLayout.rotate_coefficient = rotate_slider.value;
    rotate_value_label.text = [NSString stringWithFormat:@"Rotate:%.1f",rotate_slider.value];
}

-(void)scale_slider_changed{
    collectionReelLayout.scale_coefficient = scale_slider.value;
    scale_value_label.text = [NSString stringWithFormat:@"Scale:%.1f",scale_slider.value];
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(61.8 * 2, 200);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
    return UIEdgeInsetsMake(0, 13, 15, 13);
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return colorArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell loadWithModel:colorArray[indexPath.row]];
    return cell;
}
@end
