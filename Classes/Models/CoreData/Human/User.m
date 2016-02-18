
#import "User.h"
#import <MagicalRecord/MagicalRecord.h>
#import "PhotoSource.h"
#import "NSString+Util.h"
#import "AccessToken.h"

@interface User ()

@end

@implementation User

+ (User *)currentUser {
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[NSString pathForFileName:@"user.plist"]];
    if (!dictionary) {
        return nil;
    }
    return [User MR_findFirstByAttribute:@"userId" withValue:dictionary[@"currentUserId"]];
}

+ (void)setCurrentUser:(User *)user {
    NSString *filePath = [NSString pathForFileName:@"user.plist"];
    if (!user) {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        return;
    }
    [@{@"currentUserId":user.userId} writeToFile:filePath atomically:NO];
}

+ (NSArray *)authenticatedUsers {
    NSArray *storedTokens = [AccessToken allTokens];
    if (!storedTokens.count) {
        return nil;
    }
    NSMutableArray *userIds = [NSMutableArray array];
    for (AccessToken *token in storedTokens) {
        [userIds addObject:token.userId];
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ANY userId IN %@", userIds];
    return [User MR_findAllWithPredicate:predicate];
}

- (void)didImport:(NSDictionary *)data {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] 'photo_'"];
    NSArray *filteredKeys = [data.allKeys filteredArrayUsingPredicate:predicate];
    for (NSString *key in filteredKeys) {
        NSArray *components = [key componentsSeparatedByString:@"_"];
        NSDictionary *dictionary = @{@"size":components[1], @"url":data[key]};
        [self addPhotoSourcesObject:[PhotoSource MR_importFromObject:dictionary]];
    }
}

- (PhotoSource *)smallestSource {
    return [self sortedSources].firstObject;
}

- (PhotoSource *)largestSource {
    return [self sortedSources].lastObject;
}

- (NSString *)fullname {
    NSString *fullname = @"";
    if (self.firstname.length) {
        fullname = [fullname stringByAppendingString:self.firstname];
    }
    if (self.lastname.length) {
        fullname = [fullname stringByAppendingFormat:@"%@%@", fullname.length?@" ":@"", self.lastname];
    }
    return fullname;
}

- (NSArray *)sortedSources {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"size" ascending:YES];
    return [self.photoSources sortedArrayUsingDescriptors:@[sortDescriptor]];
}

- (NSString *)pathForFileName:(NSString *)name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths[0] stringByAppendingPathComponent:name];
}

@end
