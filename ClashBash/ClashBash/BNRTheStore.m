//
//  BNRTheStore.m
//  ClashBash
//
//  Created by Steve Brettschneider on 11/14/13.
//  Copyright (c) 2013 The Guys. All rights reserved.
//

#import "BNRTheStore.h"
#import <AFNetworking/AFNetworking.h>


@interface BNRTheStore ()

@property (nonatomic, strong) NSArray *catalog_items;
@property (nonatomic) NSString *storeURL;

@end

@implementation BNRTheStore

-(id)initWithURL:(NSString *)urlString {
    self = [super init];
    if (self != nil) {
        self.storeURL = urlString;
    }
    return self;
}

-(void)loadCatalogItems {
    NSURL *url = [NSURL URLWithString:self.storeURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]
                                         initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Successfull call to url");
        self.catalog_items = responseObject;
        if (self.complete) {
            self.complete(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error. %@", error);
    }];
    
    [operation start];
}

-(bool)placeOrderForAccount:(NSString *)account ForItem:(NSInteger)item {
    return true;
}

-(NSMutableArray *)history {
    NSMutableArray *returnArray = [[NSMutableArray alloc] initWithCapacity:4];
    [returnArray addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@{@"ACCOUNT": @"JON", @"ORDER": @"new", @"KEY": @"ahBzfmJuci1mcnVpdGl0ZW1zcgsLEgVPcmRlchgBDA"}, nil]];
    [returnArray addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@{@"ACCOUNT": @"TC456", @"ORDER": @"new", @"KEY": @"ahBzfmJuci1mcnVpdGl0ZW1zcgwLEgVPcmRlchjRDww"}, nil]];
    [returnArray addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@{@"ACCOUNT": @"TZ123", @"ORDER": @"Hat", @"KEY": @"ahBzfmJuci1mcnVpdGl0ZW1zcgwLEgVPcmRlchi5Fww"}, nil]];
    [returnArray addObject:[[NSDictionary alloc] initWithObjectsAndKeys:@{@"ACCOUNT": @"TZ123", @"ORDER": @"Hat", @"KEY": @"ahBzfmJuci1mcnVpdGl0ZW1zcgwLEgVPcmRlchiJJww"}, nil]];
    
    return returnArray;
}






@end
