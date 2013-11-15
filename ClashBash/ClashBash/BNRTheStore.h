//
//  BNRTheStore.h
//  ClashBash
//
//  Created by Steve Brettschneider on 11/14/13.
//  Copyright (c) 2013 The Guys. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionBlock)(NSArray *response);


@interface BNRTheStore : NSObject

@property (nonatomic, readwrite, copy) CompletionBlock complete;

- (id)initWithURL:(NSString *)urlString;
- (bool)placeOrderForAccount:(NSString *)account ForItem:(NSInteger)item;
- (NSArray *)history;

- (void)loadCatalogItems;


@end
