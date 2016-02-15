// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FeedItem.h instead.

#import <CoreData/CoreData.h>

extern const struct FeedItemAttributes {
	__unsafe_unretained NSString *commentsCount;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *itemId;
	__unsafe_unretained NSString *likesCount;
	__unsafe_unretained NSString *repostsCount;
	__unsafe_unretained NSString *text;
} FeedItemAttributes;

extern const struct FeedItemRelationships {
	__unsafe_unretained NSString *attachments;
	__unsafe_unretained NSString *user;
} FeedItemRelationships;

extern const struct FeedItemUserInfo {
	__unsafe_unretained NSString *relatedByAttribute;
} FeedItemUserInfo;

@class Attachment;
@class User;

@interface FeedItemID : NSManagedObjectID {}
@end

@interface _FeedItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FeedItemID* objectID;

@property (nonatomic, strong) NSNumber* commentsCount;

@property (atomic) int16_t commentsCountValue;
- (int16_t)commentsCountValue;
- (void)setCommentsCountValue:(int16_t)value_;

//- (BOOL)validateCommentsCount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* date;

//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* itemId;

@property (atomic) int32_t itemIdValue;
- (int32_t)itemIdValue;
- (void)setItemIdValue:(int32_t)value_;

//- (BOOL)validateItemId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* likesCount;

@property (atomic) int16_t likesCountValue;
- (int16_t)likesCountValue;
- (void)setLikesCountValue:(int16_t)value_;

//- (BOOL)validateLikesCount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* repostsCount;

@property (atomic) int16_t repostsCountValue;
- (int16_t)repostsCountValue;
- (void)setRepostsCountValue:(int16_t)value_;

//- (BOOL)validateRepostsCount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *attachments;

- (NSMutableSet*)attachmentsSet;

@property (nonatomic, strong) User *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;

@end

@interface _FeedItem (AttachmentsCoreDataGeneratedAccessors)
- (void)addAttachments:(NSSet*)value_;
- (void)removeAttachments:(NSSet*)value_;
- (void)addAttachmentsObject:(Attachment*)value_;
- (void)removeAttachmentsObject:(Attachment*)value_;

@end

@interface _FeedItem (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveCommentsCount;
- (void)setPrimitiveCommentsCount:(NSNumber*)value;

- (int16_t)primitiveCommentsCountValue;
- (void)setPrimitiveCommentsCountValue:(int16_t)value_;

- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;

- (NSNumber*)primitiveItemId;
- (void)setPrimitiveItemId:(NSNumber*)value;

- (int32_t)primitiveItemIdValue;
- (void)setPrimitiveItemIdValue:(int32_t)value_;

- (NSNumber*)primitiveLikesCount;
- (void)setPrimitiveLikesCount:(NSNumber*)value;

- (int16_t)primitiveLikesCountValue;
- (void)setPrimitiveLikesCountValue:(int16_t)value_;

- (NSNumber*)primitiveRepostsCount;
- (void)setPrimitiveRepostsCount:(NSNumber*)value;

- (int16_t)primitiveRepostsCountValue;
- (void)setPrimitiveRepostsCountValue:(int16_t)value_;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (NSMutableSet*)primitiveAttachments;
- (void)setPrimitiveAttachments:(NSMutableSet*)value;

- (User*)primitiveUser;
- (void)setPrimitiveUser:(User*)value;

@end
