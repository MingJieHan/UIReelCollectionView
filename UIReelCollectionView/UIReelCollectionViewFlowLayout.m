//
//  UIReelCollectionViewFlowLayout.m
//  UIReelCollectionView
//
//  Created by Han Mingjie on 2020/7/11.
//  Copyright © 2020 MingJie Han. All rights reserved.
//

#import "UIReelCollectionViewFlowLayout.h"

@implementation UIReelCollectionViewFlowLayout
@synthesize scale_coefficient;
@synthesize rotate_coefficient;

-(id)init{
    self = [super init];
    if (self){
        scale_coefficient = 1.5f;
        rotate_coefficient = 1.f;
    }
    return self;
}
- (void)prepareLayout {
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat margin = (self.collectionView.frame.size.width - self.itemSize.width) / 2;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, margin, 0, margin);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributesArray = [super layoutAttributesForElementsInRect:rect];
    CGFloat ceterX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    for (UICollectionViewLayoutAttributes *attributes in attributesArray) {
        CGFloat delta = attributes.center.x - ceterX;
        CGFloat scale = (1.1 - ABS(delta) / self.collectionView.frame.size.width) * scale_coefficient;
        CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
        attributes.transform = CGAffineTransformRotate(transform, (delta/self.collectionView.frame.size.width) * rotate_coefficient);
    }
    return attributesArray;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    CGRect rect;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;

    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;

    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in arr) {
        if (ABS(minDelta) > ABS(attrs.center.x - centerX)) {
            minDelta = attrs.center.x - centerX;
        }
    }
    proposedContentOffset.x += minDelta;
    return proposedContentOffset;
}
@end
