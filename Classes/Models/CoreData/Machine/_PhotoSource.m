// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PhotoSource.m instead.

#import "_PhotoSource.h"

const struct PhotoSourceAttributes PhotoSourceAttributes = {
	.size = @"size",
	.url = @"url",
};

const struct PhotoSourceRelationships PhotoSourceRelationships = {
	.attachment = @"attachment",
};

const struct PhotoSourceUserInfo PhotoSourceUserInfo = {
	.relatedByAttribute = @"url",
};

@implementation PhotoSourceID
@end

@implementation _PhotoSource

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoSource" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoSource";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoSource" inManagedObjectContext:moc_];
}

- (PhotoSourceID*)objectID {
	return (PhotoSourceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"sizeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"size"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic size;

- (int16_t)sizeValue {
	NSNumber *result = [self size];
	return [result shortValue];
}

- (void)setSizeValue:(int16_t)value_ {
	[self setSize:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveSizeValue {
	NSNumber *result = [self primitiveSize];
	return [result shortValue];
}

- (void)setPrimitiveSizeValue:(int16_t)value_ {
	[self setPrimitiveSize:[NSNumber numberWithShort:value_]];
}

@dynamic url;

@dynamic attachment;

@end

