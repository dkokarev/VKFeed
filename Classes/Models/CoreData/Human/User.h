#import "_User.h"

@class PhotoSource;

@interface User : _User {}

@property (nonatomic, strong, readonly) PhotoSource *smallestSource;
@property (nonatomic, strong, readonly) PhotoSource *largestSource;
@property (nonatomic, strong, readonly) NSString *fullname;

@end
