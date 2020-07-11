//
//  CollectionViewCell.m
//  UIReelCollectionView
//
//  Created by Han Mingjie on 2020/7/11.
//  Copyright © 2020 MingJie Han. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell(){
    UIImageView *img;
}

@end

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, frame.size.width, 30.f)];
        name.text = @"ABC";
        [self addSubview:name];
        
        img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        img.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        img.contentMode = UIViewContentModeScaleAspectFill;
        img.layer.masksToBounds = YES;
        [img.layer setCornerRadius:5];
        [self.contentView addSubview:img];
    }
    return self;
}


- (void)loadWithModel:(NSDictionary *)model{
    img.backgroundColor = model[@"color"];
}
@end
