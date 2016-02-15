//
//  ApiHelper.h
//  VKFeed
//
//  Created by danny on 13.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VKRequest;

@interface ApiHelper : NSObject

+ (VKRequest *)getWallItemsForPage:(NSInteger)page success:(void(^)(NSArray *items, BOOL allPagesLoaded, BOOL fromCache))success failure:(void(^)(NSError *error))failure;

@end
