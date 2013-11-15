//
//  BNRCatalogViewController.m
//  ClashBash
//
//  Created by Steve Brettschneider on 11/14/13.
//  Copyright (c) 2013 The Guys. All rights reserved.
//

#import "BNRCatalogViewController.h"
#import "BNRTheStore.h"
#import "BNRCatalogItemCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface BNRCatalogViewController ()

@end

@implementation BNRCatalogViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self refreshItems];
}

- (void)refreshItems {
    BNRTheStore *store = [[BNRTheStore alloc] initWithURL:@"https://bnr-fruititems.appspot.com"];
    store.complete = ^(NSArray* response) {
        NSLog(@"%@", response);
        self.catalogItems = (NSArray *)response;
        [self.tableView reloadData];
    };
    [store loadCatalogItems];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.catalogItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"catalogItemCell";
    BNRCatalogItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *catalogItem = [self.catalogItems objectAtIndex:indexPath.row];
    cell.catalogItem = catalogItem;
    UIImage *tempImage = [UIImage imageNamed:@"loading_anim"];
    NSURL *imageUrl = [NSURL URLWithString:[catalogItem objectForKey:@"image"]];
    [cell.itemImage setImageWithURL:imageUrl placeholderImage:tempImage];

    return cell;
}

@end
