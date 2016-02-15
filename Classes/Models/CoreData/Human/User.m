
#import "User.h"
#import <MagicalRecord/MagicalRecord.h>
#import "PhotoSource.h"

@interface User ()

@end

@implementation User

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

@end
