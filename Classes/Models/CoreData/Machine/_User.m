// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.m instead.

#import "_User.h"

const struct UserAttributes UserAttributes = {
	.firstname = @"firstname",
	.lastname = @"lastname",
	.userId = @"userId",
};

const struct UserRelationships UserRelationships = {
	.feedItems = @"feedItems",
	.photoSources = @"photoSources",
};

const struct UserUserInfo UserUserInfo = {
	.relatedByAttribute = @"userId",
};

@implementation UserID
@end

@implementation _User

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (UserID*)objectID {
	return (UserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"userIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"userId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic firstname;

@dynamic lastname;

@dynamic userId;

- (int32_t)userIdValue {
	NSNumber *result = [self userId];
	return [result intValue];
}

- (void)setUserIdValue:(int32_t)value_ {
	[self setUserId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveUserIdValue {
	NSNumber *result = [self primitiveUserId];
	return [result intValue];
}

- (void)setPrimitiveUserIdValue:(int32_t)value_ {
	[self setPrimitiveUserId:[NSNumber numberWithInt:value_]];
}

@dynamic feedItems;

- (NSMutableSet*)feedItemsSet {
	[self willAccessValueForKey:@"feedItems"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"feedItems"];

	[self didAccessValueForKey:@"feedItems"];
	return result;
}

@dynamic photoSources;

- (NSMutableSet*)photoSourcesSet {
	[self willAccessValueForKey:@"photoSources"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"photoSources"];

	[self didAccessValueForKey:@"photoSources"];
	return result;
}

@end

