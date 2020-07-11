//
//  UIReelCollectionViewFlowLayout.h
//  UIReelCollectionView
//
//  Created by Han Mingjie on 2020/7/11.
//  Copyright © 2020 MingJie Han. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIReelCollectionViewFlowLayout : UICollectionViewFlowLayout{
    float scale_coefficient;
    float rotate_coefficient;
}
@property (nonatomic) float scale_coefficient;
@property (nonatomic) float rotate_coefficient;
@end

NS_ASSUME_NONNULL_END
