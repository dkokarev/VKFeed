
#import "Attachment.h"
#import <MagicalRecord/MagicalRecord.h>
#import "PhotoSource.h"

@interface Attachment ()

@end

@implementation Attachment

- (void)didImport:(NSDictionary *)data {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] 'photo_'"];
    NSArray *filteredKeys = [data.allKeys filteredArrayUsingPredicate:predicate];
    for (NSString *key in filteredKeys) {
        NSArray *components = [key componentsSeparatedByString:@"_"];
        NSDictionary *dictionary = @{@"size":components[1], @"url":data[key]};
        [self addSourcesObject:[PhotoSource MR_importFromObject:dictionary]];
    }
}

- (PhotoSource *)smallestSource {
    return [self sortedSources].firstObject;
}

- (PhotoSource *)largestSource {
    return [self sortedSources].lastObject;
}

- (NSArray *)sortedSources {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"size" ascending:YES];
    return [self.sources sortedArrayUsingDescriptors:@[sortDescriptor]];
}

@end
