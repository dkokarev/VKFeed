//
//  NSString+Util.m
//  VKFeed
//
//  Created by danny on 15.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

+ (NSString *)pathForFileName:(NSString *)name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths[0] stringByAppendingPathComponent:name];
}

- (NSString *)substringBetweenString:(NSString *)string1 andString:(NSString *)string2 {
    NSRange r1 = [self rangeOfString:string1];
    NSRange r2 = [self rangeOfString:string2];
    NSRange range = NSMakeRange(r1.location + r1.length, r2.location - r1.location - r1.length);
    return [self substringWithRange:range];
}

@end
