//
//  SLViewController.m
//  MWStackLayout
//
//  Created by Mark Warnick on 6/6/13.
//  Copyright (c) 2013 Mark Warnick. All rights reserved.
//

#import "MWViewController.h"
#import "MWStackLayout.h"

#define MAX_NUMBER_OF_IMAGES 15

@interface MWViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSMutableArray *images;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet MWStackLayout *stackLayout;


@end

@implementation MWViewController


#pragma mark - View life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.stackLayout.percentExpanded = 1.0f;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return MAX_NUMBER_OF_IMAGES;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    
    return photoCell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *selectedPhotoCell = [self.collectionView cellForItemAtIndexPath:indexPath];
    self.stackLayout.stackCenter = selectedPhotoCell.center;
    
    [self.collectionView performBatchUpdates:^{
        self.stackLayout.percentExpanded = !self.stackLayout.percentExpanded;
    } completion:nil];
}


#pragma mark - Memory management
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
