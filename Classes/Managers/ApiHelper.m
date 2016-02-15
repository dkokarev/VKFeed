//
//  ApiHelper.m
//  VKFeed
//
//  Created by danny on 13.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import "ApiHelper.h"
#import <VK-ios-sdk/VKSdk.h>
#import <MagicalRecord/MagicalRecord.h>
#import "FeedItem.h"
#import "User.h"

static const NSInteger WallPageCount = 20;

@implementation ApiHelper

+ (VKRequest *)getWallItemsForPage:(NSInteger)page success:(void(^)(NSArray *items, BOOL allPagesLoaded, BOOL fromCache))success failure:(void(^)(NSError *error))failure {
    if (!success) {
        return nil;
    }
    if (page == 0) {
        NSFetchRequest *fetchRequest = [FeedItem MR_requestAllSortedBy:@"itemId" ascending:NO];
        fetchRequest.fetchLimit = WallPageCount;
        NSArray *storedItems = [FeedItem MR_executeFetchRequest:fetchRequest];
        if (storedItems.count) {
            success(storedItems, NO, YES);
        }
    }
    VKRequest *request = [VKRequest requestWithMethod:@"wall.get"
                                           parameters:@{VK_API_OWNER_ID:[VKSdk accessToken].userId,
                                                        @"extended":@1,
                                                        @"offset":@(WallPageCount * page),
                                                        @"count":@(WallPageCount)}];
    [request executeWithResultBlock:^(VKResponse *response) {
        [User MR_importFromArray:response.json[@"profiles"]];
        NSArray *items = response.json[@"items"];
        success([FeedItem MR_importFromArray:items], items.count % WallPageCount != 0 || items.count == 0, NO);
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
    } errorBlock:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    return request;
}

@end
