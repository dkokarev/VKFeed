#import "_Attachment.h"

@class PhotoSource;

@interface Attachment : _Attachment {}

@property (nonatomic, strong, readonly) PhotoSource *smallestSource;
@property (nonatomic, strong, readonly) PhotoSource *largestSource;

@end
