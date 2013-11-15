//
//  BNRCatalogItemCell.m
//  ClashBash
//
//  Created by Steve Brettschneider on 11/14/13.
//  Copyright (c) 2013 The Guys. All rights reserved.
//

#import "BNRCatalogItemCell.h"

@implementation BNRCatalogItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCatalogItem:(NSDictionary *)catalogItem {
    self.itemNameLabel.text = [catalogItem objectForKey:@"name"];
    NSString *priceString = [NSString stringWithFormat:@"$%@", [catalogItem objectForKey:@"basePrice"]];
    self.itemPriceLabel.text = priceString;
}

@end
