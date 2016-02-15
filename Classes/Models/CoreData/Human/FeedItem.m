
#import "FeedItem.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Attachment.h"
#import "User.h"

@interface FeedItem ()

@end

@implementation FeedItem

- (NSString *)formattedDate {
    if (!self.date) {
        return nil;
    }
    static NSDateFormatter *dateformatter;
    if (!dateformatter) {
        dateformatter = [[NSDateFormatter alloc] init];
        dateformatter.dateFormat = @"dd MMM yyyy";
    }
    return [dateformatter stringFromDate:self.date];
}

- (void)didImport:(id)data {
    if (![data isKindOfClass:[NSDictionary class]]) {
        return;
    }
    self.user = [User MR_findFirstByAttribute:@"userId" withValue:data[@"from_id"]];
}

- (BOOL)shouldImportAttachments:(id)data {
    if (![data isKindOfClass:[NSArray class]]) {
        return NO;
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"type == 'photo'"];
    NSArray *filteredAttachments = [data filteredArrayUsingPredicate:predicate];
    for (NSDictionary *dictionary in filteredAttachments) {
        [self addAttachmentsObject:[Attachment MR_importFromObject:dictionary[@"photo"]]];
    }
    return NO;
}

- (FeedItemContentType)contentType {
    if (self.text.length && self.attachments.count) {
        return ContentTypeFull;
    } else if (self.text.length) {
        return ContentTypeOnlyText;
    } else if (self.attachments.count) {
        return ContentTypeOnlyImage;
    }
    return ContentTypeEmpty;
}

@end
