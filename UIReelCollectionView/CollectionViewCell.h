//
//  CollectionViewCell.h
//  UIReelCollectionView
//
//  Created by Han Mingjie on 2020/7/11.
//  Copyright © 2020 MingJie Han. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell
- (void)loadWithModel:(NSDictionary *)model;
@end

NS_ASSUME_NONNULL_END
