//
//  AccessToken.h
//  VKFeed
//
//  Created by danny on 15.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccessToken : NSObject <NSSecureCoding>

@property (nonatomic, strong, readonly) NSString *token;
@property (nonatomic, strong, readonly) NSString *userId;
@property (nonatomic, strong, readonly) NSDate *expireDate;
@property (nonatomic, assign, readonly) BOOL isValid;

- (instancetype)initWithToken:(NSString *)token userId:(NSString *)userId expireDate:(NSDate *)date;
+ (instancetype)accessTokenWithToken:(NSString *)token userId:(NSString *)userId expireDate:(NSDate *)date;
+ (instancetype)currentToken;
+ (instancetype)tokenWithUserId:(NSString *)userId;
+ (void)addToken:(AccessToken *)token error:(NSError **)error;
+ (NSArray *)allTokens;

@end
