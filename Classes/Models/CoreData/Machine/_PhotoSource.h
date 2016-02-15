// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PhotoSource.h instead.

#import <CoreData/CoreData.h>

extern const struct PhotoSourceAttributes {
	__unsafe_unretained NSString *size;
	__unsafe_unretained NSString *url;
} PhotoSourceAttributes;

extern const struct PhotoSourceRelationships {
	__unsafe_unretained NSString *attachment;
	__unsafe_unretained NSString *user;
} PhotoSourceRelationships;

extern const struct PhotoSourceUserInfo {
	__unsafe_unretained NSString *relatedByAttribute;
} PhotoSourceUserInfo;

@class Attachment;
@class User;

@interface PhotoSourceID : NSManagedObjectID {}
@end

@interface _PhotoSource : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PhotoSourceID* objectID;

@property (nonatomic, strong) NSNumber* size;

@property (atomic) int16_t sizeValue;
- (int16_t)sizeValue;
- (void)setSizeValue:(int16_t)value_;

//- (BOOL)validateSize:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* url;

//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Attachment *attachment;

//- (BOOL)validateAttachment:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) User *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;

@end

@interface _PhotoSource (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveSize;
- (void)setPrimitiveSize:(NSNumber*)value;

- (int16_t)primitiveSizeValue;
- (void)setPrimitiveSizeValue:(int16_t)value_;

- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;

- (Attachment*)primitiveAttachment;
- (void)setPrimitiveAttachment:(Attachment*)value;

- (User*)primitiveUser;
- (void)setPrimitiveUser:(User*)value;

@end
