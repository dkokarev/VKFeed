//
//  ApiHelper.m
//  VKFeed
//
//  Created by danny on 13.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import "ApiHelper.h"
#import <VK-ios-sdk/VKSdk.h>
#import <AFNetworking/AFNetworking.h>
#import <MagicalRecord/MagicalRecord.h>
#import "FeedItem.h"
#import "User.h"

static const NSInteger WallPageCount = 20;
static NSString * const BaseUrl = @"https://api.vk.com/method/";

@implementation ApiHelper

+ (NSURLSessionDataTask *)getWallItemsForPage:(NSInteger)page success:(void(^)(NSArray *items, BOOL allPagesLoaded, BOOL fromCache))success failure:(void(^)(NSError *error))failure {
    if (!success) {
        return nil;
    }
    if (page == 0) {
        NSFetchRequest *fetchRequest = [FeedItem MR_requestAllSortedBy:@"date" ascending:NO];
        fetchRequest.fetchLimit = WallPageCount;
        fetchRequest.predicate = [NSPredicate predicateWithFormat:@"user.userId == %@", [VKSdk accessToken].userId];
        NSArray *storedItems = [FeedItem MR_executeFetchRequest:fetchRequest];
        if (storedItems.count) {
            success(storedItems, NO, YES);
        }
    }
    // VK SDK
    /*
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
     */
    NSURLSessionDataTask *task =
    [[AFHTTPSessionManager manager] GET:[BaseUrl stringByAppendingString:@"wall.get"]
                             parameters:@{VK_API_OWNER_ID:[VKSdk accessToken].userId,
                                          @"extended":@1,
                                          @"offset":@(WallPageCount * page),
                                          @"count":@(WallPageCount),
                                          @"access_token":[VKSdk accessToken].accessToken,
                                          @"v":@5.45,
                                          @"https":@1}
                               progress:nil
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    NSDictionary *response = responseObject[@"response"];
                                    [User MR_importFromArray:response[@"profiles"]];
                                    NSArray *items = response[@"items"];
                                    success([FeedItem MR_importFromArray:items], items.count % WallPageCount != 0 || items.count == 0, NO);
                                    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
                                }
                                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    if (failure) {
                                        failure(error);
                                    }
                                }];
    return task;
}

@end
