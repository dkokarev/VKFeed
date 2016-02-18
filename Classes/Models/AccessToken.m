//
//  AccessToken.m
//  VKFeed
//
//  Created by danny on 15.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import "AccessToken.h"
#import <UICKeyChainStore/UICKeyChainStore.h>
#import "User.h"

static NSString *TokenKey = @"token";
static NSString *UserIdKey = @"userId";
static NSString *ExpireDateKey = @"expireDate";

static NSString *KeyChainServiceName = @"com.danny.vk-token";

@interface AccessToken ()

@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSDate *expireDate;

@end

@implementation AccessToken

+ (instancetype)currentToken {
    return [AccessToken tokenWithUserId:[User currentUser].userId.stringValue];
}

+ (instancetype)tokenWithUserId:(NSString *)userId {
    if (!userId) {
        return nil;
    }
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:KeyChainServiceName];
    return [NSKeyedUnarchiver unarchiveObjectWithData:[keychain dataForKey:userId]];
}

+ (NSArray *)allTokens {
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:KeyChainServiceName];
    NSArray *tokens = [keychain allItems];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:tokens.count];
    for (NSDictionary *dictionary in tokens) {
        [array addObject:[NSKeyedUnarchiver unarchiveObjectWithData:dictionary[@"value"]]];
    }
    return array;
}

+ (void)addToken:(AccessToken *)token error:(NSError **)error {
    if (!token) {
        return;
    }
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:KeyChainServiceName];
    [keychain removeItemForKey:token.userId];
    [keychain setData:[NSKeyedArchiver archivedDataWithRootObject:token] forKey:token.userId error:error];
}

+ (instancetype)accessTokenWithToken:(NSString *)token userId:(NSString *)userId expireDate:(NSDate *)date {
    return [[AccessToken alloc] initWithToken:token userId:userId expireDate:date];
}

- (instancetype)initWithToken:(NSString *)token userId:(NSString *)userId expireDate:(NSDate *)date {
    if (!token || !userId || !date) {
        return nil;
    }
    self = [super init];
    if (self) {
        _token = token;
        _userId = userId;
        _expireDate = date;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _token = [aDecoder decodeObjectOfClass:[NSString class] forKey:TokenKey];
        _userId = [aDecoder decodeObjectOfClass:[NSString class] forKey:UserIdKey];
        _expireDate = [aDecoder decodeObjectOfClass:[NSDate class] forKey:ExpireDateKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_token forKey:TokenKey];
    [aCoder encodeObject:_userId forKey:UserIdKey];
    [aCoder encodeObject:_expireDate forKey:ExpireDateKey];
}

- (BOOL)isValid {
    if (!self.expireDate) {
        return NO;
    }
    return [[NSDate date] compare:self.expireDate] == NSOrderedAscending;
}

#pragma mark - NSSecureCoding

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
