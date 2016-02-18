//
//  NSString+Util.h
//  VKFeed
//
//  Created by danny on 15.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

+ (NSString *)pathForFileName:(NSString *)name;
- (NSString *)substringBetweenString:(NSString *)string1 andString:(NSString *)string2;

@end
