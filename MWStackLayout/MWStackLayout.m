//
//  MWStackLayout.m
//  MWStackLayout
//
//  Created by Mark Warnick on 6/6/13.
//  Copyright (c) 2013 Mark Warnick. All rights reserved.
//

#import "MWStackLayout.h"

@implementation MWStackLayout
// Custom setter for redrawing the layout
- (void)setPercentExpanded:(CGFloat)percentExpanded {
    _percentExpanded = percentExpanded;
    
    [self invalidateLayout];
}

- (void)setStackCenter:(CGPoint)stackCenter {
    _stackCenter = stackCenter;
    
    [self invalidateLayout];
}
// Animation of cells only works WITHIN the bounds of the contentView.
// Enlarge the contentView to the size of the collectionView if needed
-(CGSize)collectionViewContentSize {
    CGSize contentSize = [super collectionViewContentSize];
    
    if (self.collectionView.bounds.size.width > contentSize.width)
        contentSize.width = self.collectionView.bounds.size.width;
    
    if (self.collectionView.bounds.size.height > contentSize.height)
        contentSize.height = self.collectionView.bounds.size.height;
    
    return contentSize;
}


-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray* attributesArray = [super layoutAttributesForElementsInRect:rect];
    
    // Calculate the new position of each cell based on stackFactor and stackCenter
    for (UICollectionViewLayoutAttributes *attributes in attributesArray) {
        CGFloat xPosition = self.stackCenter.x + (attributes.center.x - self.stackCenter.x) * self.percentExpanded;
        CGFloat yPosition = self.stackCenter.y + (attributes.center.y - self.stackCenter.y) * self.percentExpanded;
        
        attributes.center = CGPointMake(xPosition, yPosition);
        
        if (attributes.indexPath.row == 0) {
            attributes.alpha = 1.0;
            attributes.zIndex = 1.0; // Put the first cell on top of the stack
        } else {
            attributes.alpha = self.percentExpanded; // fade the other cells out
            attributes.zIndex = 0.0; //Other cells below the first one
        }
    }
    
    return attributesArray;
}

@end
