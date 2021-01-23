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
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor redColor];
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, frame.size.width, 30.f)];
        name.text = @"ABC";
        [self addSubview:name];
        
        img = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 40.f, 40.f)];
//        img.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//        [img setCenter:self.center];
        img.contentMode = UIViewContentModeScaleAspectFill;
        img.layer.masksToBounds = YES;
        [img.layer setCornerRadius:5];
        NSString *file = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"png"];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:file];
        img.image = image;
        [self.contentView addSubview:img];
    }
    return self;
}


- (void)loadWithModel:(NSDictionary *)model{
    img.backgroundColor = model[@"color"];
}
@end
