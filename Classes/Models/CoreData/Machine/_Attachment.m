// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Attachment.m instead.

#import "_Attachment.h"

const struct AttachmentAttributes AttachmentAttributes = {
	.attachmentId = @"attachmentId",
	.height = @"height",
	.ownerId = @"ownerId",
	.text = @"text",
	.width = @"width",
};

const struct AttachmentRelationships AttachmentRelationships = {
	.feedItem = @"feedItem",
	.sources = @"sources",
};

const struct AttachmentUserInfo AttachmentUserInfo = {
	.relatedByAttribute = @"attachmentId",
};

@implementation AttachmentID
@end

@implementation _Attachment

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Attachment" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Attachment";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Attachment" inManagedObjectContext:moc_];
}

- (AttachmentID*)objectID {
	return (AttachmentID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"attachmentIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"attachmentId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"heightValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"height"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"ownerIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"ownerId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"widthValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"width"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic attachmentId;

- (int32_t)attachmentIdValue {
	NSNumber *result = [self attachmentId];
	return [result intValue];
}

- (void)setAttachmentIdValue:(int32_t)value_ {
	[self setAttachmentId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveAttachmentIdValue {
	NSNumber *result = [self primitiveAttachmentId];
	return [result intValue];
}

- (void)setPrimitiveAttachmentIdValue:(int32_t)value_ {
	[self setPrimitiveAttachmentId:[NSNumber numberWithInt:value_]];
}

@dynamic height;

- (int32_t)heightValue {
	NSNumber *result = [self height];
	return [result intValue];
}

- (void)setHeightValue:(int32_t)value_ {
	[self setHeight:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveHeightValue {
	NSNumber *result = [self primitiveHeight];
	return [result intValue];
}

- (void)setPrimitiveHeightValue:(int32_t)value_ {
	[self setPrimitiveHeight:[NSNumber numberWithInt:value_]];
}

@dynamic ownerId;

- (int32_t)ownerIdValue {
	NSNumber *result = [self ownerId];
	return [result intValue];
}

- (void)setOwnerIdValue:(int32_t)value_ {
	[self setOwnerId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveOwnerIdValue {
	NSNumber *result = [self primitiveOwnerId];
	return [result intValue];
}

- (void)setPrimitiveOwnerIdValue:(int32_t)value_ {
	[self setPrimitiveOwnerId:[NSNumber numberWithInt:value_]];
}

@dynamic text;

@dynamic width;

- (int32_t)widthValue {
	NSNumber *result = [self width];
	return [result intValue];
}

- (void)setWidthValue:(int32_t)value_ {
	[self setWidth:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveWidthValue {
	NSNumber *result = [self primitiveWidth];
	return [result intValue];
}

- (void)setPrimitiveWidthValue:(int32_t)value_ {
	[self setPrimitiveWidth:[NSNumber numberWithInt:value_]];
}

@dynamic feedItem;

@dynamic sources;

- (NSMutableSet*)sourcesSet {
	[self willAccessValueForKey:@"sources"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"sources"];

	[self didAccessValueForKey:@"sources"];
	return result;
}

@end

