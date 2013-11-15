//
//  BNRCatalogViewController.h
//  ClashBash
//
//  Created by Steve Brettschneider on 11/14/13.
//  Copyright (c) 2013 The Guys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRTheStore.h"

@interface BNRCatalogViewController : UITableViewController

@property (nonatomic, strong) BNRTheStore *theStore;
@property (nonatomic, strong) NSArray *catalogItems;

@end
