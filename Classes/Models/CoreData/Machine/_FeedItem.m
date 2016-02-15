// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FeedItem.m instead.

#import "_FeedItem.h"

const struct FeedItemAttributes FeedItemAttributes = {
	.commentsCount = @"commentsCount",
	.date = @"date",
	.itemId = @"itemId",
	.likesCount = @"likesCount",
	.repostsCount = @"repostsCount",
	.text = @"text",
};

const struct FeedItemRelationships FeedItemRelationships = {
	.attachments = @"attachments",
	.user = @"user",
};

const struct FeedItemUserInfo FeedItemUserInfo = {
	.relatedByAttribute = @"itemId",
};

@implementation FeedItemID
@end

@implementation _FeedItem

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"FeedItem" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"FeedItem";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"FeedItem" inManagedObjectContext:moc_];
}

- (FeedItemID*)objectID {
	return (FeedItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"commentsCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"commentsCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"itemIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"itemId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"likesCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"likesCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"repostsCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"repostsCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic commentsCount;

- (int16_t)commentsCountValue {
	NSNumber *result = [self commentsCount];
	return [result shortValue];
}

- (void)setCommentsCountValue:(int16_t)value_ {
	[self setCommentsCount:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveCommentsCountValue {
	NSNumber *result = [self primitiveCommentsCount];
	return [result shortValue];
}

- (void)setPrimitiveCommentsCountValue:(int16_t)value_ {
	[self setPrimitiveCommentsCount:[NSNumber numberWithShort:value_]];
}

@dynamic date;

@dynamic itemId;

- (int32_t)itemIdValue {
	NSNumber *result = [self itemId];
	return [result intValue];
}

- (void)setItemIdValue:(int32_t)value_ {
	[self setItemId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveItemIdValue {
	NSNumber *result = [self primitiveItemId];
	return [result intValue];
}

- (void)setPrimitiveItemIdValue:(int32_t)value_ {
	[self setPrimitiveItemId:[NSNumber numberWithInt:value_]];
}

@dynamic likesCount;

- (int16_t)likesCountValue {
	NSNumber *result = [self likesCount];
	return [result shortValue];
}

- (void)setLikesCountValue:(int16_t)value_ {
	[self setLikesCount:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveLikesCountValue {
	NSNumber *result = [self primitiveLikesCount];
	return [result shortValue];
}

- (void)setPrimitiveLikesCountValue:(int16_t)value_ {
	[self setPrimitiveLikesCount:[NSNumber numberWithShort:value_]];
}

@dynamic repostsCount;

- (int16_t)repostsCountValue {
	NSNumber *result = [self repostsCount];
	return [result shortValue];
}

- (void)setRepostsCountValue:(int16_t)value_ {
	[self setRepostsCount:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRepostsCountValue {
	NSNumber *result = [self primitiveRepostsCount];
	return [result shortValue];
}

- (void)setPrimitiveRepostsCountValue:(int16_t)value_ {
	[self setPrimitiveRepostsCount:[NSNumber numberWithShort:value_]];
}

@dynamic text;

@dynamic attachments;

- (NSMutableSet*)attachmentsSet {
	[self willAccessValueForKey:@"attachments"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"attachments"];

	[self didAccessValueForKey:@"attachments"];
	return result;
}

@dynamic user;

@end

