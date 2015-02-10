// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DLMKNote.m instead.

#import "_DLMKNote.h"

const struct DLMKNoteAttributes DLMKNoteAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
	.text = @"text",
};

const struct DLMKNoteRelationships DLMKNoteRelationships = {
	.location = @"location",
	.notebook = @"notebook",
	.photo = @"photo",
};

@implementation DLMKNoteID
@end

@implementation _DLMKNote

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (DLMKNoteID*)objectID {
	return (DLMKNoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic text;

@dynamic location;

@dynamic notebook;

@dynamic photo;

@end

