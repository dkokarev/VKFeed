#import "_FeedItem.h"

typedef enum {
    ContentTypeEmpty,
    ContentTypeOnlyText,
    ContentTypeOnlyImage,
    ContentTypeFull
} FeedItemContentType;

@interface FeedItem : _FeedItem {}

@property (nonatomic, assign, readonly) FeedItemContentType contentType;
@property (nonatomic, strong, readonly) NSString *formattedDate;

@end
