//
//  MWStackLayout.h
//  MWStackLayout
//
//  Created by Mark Warnick on 6/6/13.
//  Copyright (c) 2013 Mark Warnick. All rights reserved.
//

#import <UIKit/UIKit.h>

/** The MWStackLayout is a subclass of the 
 */

@interface MWStackLayout : UICollectionViewFlowLayout

/** the point to which the stack collapses
 */
@property (nonatomic) CGPoint stackCenter;

/** the amount the stack is expanded from the stack center.
 
 0.0 is completely stacked, 1.0 is expanded to default grid view. Larger than 1.0 will spread the layout even more
 */
@property (nonatomic) CGFloat percentExpanded;

/** determines if the cells under the top cell are shown or not
 */
@property (nonatomic) BOOL showStack;

@end
