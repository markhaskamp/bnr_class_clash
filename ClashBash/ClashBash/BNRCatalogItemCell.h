//
//  BNRCatalogItemCell.h
//  ClashBash
//
//  Created by Steve Brettschneider on 11/14/13.
//  Copyright (c) 2013 The Guys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRCatalogItemCell : UITableViewCell

@property (nonatomic, weak) NSDictionary *catalogItem;

@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;

@end
