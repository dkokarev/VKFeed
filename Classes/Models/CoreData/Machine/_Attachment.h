// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Attachment.h instead.

#import <CoreData/CoreData.h>

extern const struct AttachmentAttributes {
	__unsafe_unretained NSString *attachmentId;
	__unsafe_unretained NSString *height;
	__unsafe_unretained NSString *ownerId;
	__unsafe_unretained NSString *text;
	__unsafe_unretained NSString *width;
} AttachmentAttributes;

extern const struct AttachmentRelationships {
	__unsafe_unretained NSString *feedItem;
	__unsafe_unretained NSString *sources;
} AttachmentRelationships;

extern const struct AttachmentUserInfo {
	__unsafe_unretained NSString *relatedByAttribute;
} AttachmentUserInfo;

@class FeedItem;
@class PhotoSource;

@interface AttachmentID : NSManagedObjectID {}
@end

@interface _Attachment : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AttachmentID* objectID;

@property (nonatomic, strong) NSNumber* attachmentId;

@property (atomic) int32_t attachmentIdValue;
- (int32_t)attachmentIdValue;
- (void)setAttachmentIdValue:(int32_t)value_;

//- (BOOL)validateAttachmentId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* height;

@property (atomic) int32_t heightValue;
- (int32_t)heightValue;
- (void)setHeightValue:(int32_t)value_;

//- (BOOL)validateHeight:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* ownerId;

@property (atomic) int32_t ownerIdValue;
- (int32_t)ownerIdValue;
- (void)setOwnerIdValue:(int32_t)value_;

//- (BOOL)validateOwnerId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* width;

@property (atomic) int32_t widthValue;
- (int32_t)widthValue;
- (void)setWidthValue:(int32_t)value_;

//- (BOOL)validateWidth:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FeedItem *feedItem;

//- (BOOL)validateFeedItem:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *sources;

- (NSMutableSet*)sourcesSet;

@end

@interface _Attachment (SourcesCoreDataGeneratedAccessors)
- (void)addSources:(NSSet*)value_;
- (void)removeSources:(NSSet*)value_;
- (void)addSourcesObject:(PhotoSource*)value_;
- (void)removeSourcesObject:(PhotoSource*)value_;

@end

@interface _Attachment (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveAttachmentId;
- (void)setPrimitiveAttachmentId:(NSNumber*)value;

- (int32_t)primitiveAttachmentIdValue;
- (void)setPrimitiveAttachmentIdValue:(int32_t)value_;

- (NSNumber*)primitiveHeight;
- (void)setPrimitiveHeight:(NSNumber*)value;

- (int32_t)primitiveHeightValue;
- (void)setPrimitiveHeightValue:(int32_t)value_;

- (NSNumber*)primitiveOwnerId;
- (void)setPrimitiveOwnerId:(NSNumber*)value;

- (int32_t)primitiveOwnerIdValue;
- (void)setPrimitiveOwnerIdValue:(int32_t)value_;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (NSNumber*)primitiveWidth;
- (void)setPrimitiveWidth:(NSNumber*)value;

- (int32_t)primitiveWidthValue;
- (void)setPrimitiveWidthValue:(int32_t)value_;

- (FeedItem*)primitiveFeedItem;
- (void)setPrimitiveFeedItem:(FeedItem*)value;

- (NSMutableSet*)primitiveSources;
- (void)setPrimitiveSources:(NSMutableSet*)value;

@end
