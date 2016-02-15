// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>

extern const struct UserAttributes {
	__unsafe_unretained NSString *firstname;
	__unsafe_unretained NSString *lastname;
	__unsafe_unretained NSString *userId;
} UserAttributes;

extern const struct UserRelationships {
	__unsafe_unretained NSString *feedItems;
	__unsafe_unretained NSString *photoSources;
} UserRelationships;

extern const struct UserUserInfo {
	__unsafe_unretained NSString *relatedByAttribute;
} UserUserInfo;

@class FeedItem;
@class PhotoSource;

@interface UserID : NSManagedObjectID {}
@end

@interface _User : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) UserID* objectID;

@property (nonatomic, strong) NSString* firstname;

//- (BOOL)validateFirstname:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lastname;

//- (BOOL)validateLastname:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* userId;

@property (atomic) int32_t userIdValue;
- (int32_t)userIdValue;
- (void)setUserIdValue:(int32_t)value_;

//- (BOOL)validateUserId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *feedItems;

- (NSMutableSet*)feedItemsSet;

@property (nonatomic, strong) NSSet *photoSources;

- (NSMutableSet*)photoSourcesSet;

@end

@interface _User (FeedItemsCoreDataGeneratedAccessors)
- (void)addFeedItems:(NSSet*)value_;
- (void)removeFeedItems:(NSSet*)value_;
- (void)addFeedItemsObject:(FeedItem*)value_;
- (void)removeFeedItemsObject:(FeedItem*)value_;

@end

@interface _User (PhotoSourcesCoreDataGeneratedAccessors)
- (void)addPhotoSources:(NSSet*)value_;
- (void)removePhotoSources:(NSSet*)value_;
- (void)addPhotoSourcesObject:(PhotoSource*)value_;
- (void)removePhotoSourcesObject:(PhotoSource*)value_;

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveFirstname;
- (void)setPrimitiveFirstname:(NSString*)value;

- (NSString*)primitiveLastname;
- (void)setPrimitiveLastname:(NSString*)value;

- (NSNumber*)primitiveUserId;
- (void)setPrimitiveUserId:(NSNumber*)value;

- (int32_t)primitiveUserIdValue;
- (void)setPrimitiveUserIdValue:(int32_t)value_;

- (NSMutableSet*)primitiveFeedItems;
- (void)setPrimitiveFeedItems:(NSMutableSet*)value;

- (NSMutableSet*)primitivePhotoSources;
- (void)setPrimitivePhotoSources:(NSMutableSet*)value;

@end
