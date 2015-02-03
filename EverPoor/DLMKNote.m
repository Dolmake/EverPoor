#import "DLMKNote.h"
#import "DLMKPhotoContainer.h"
#import "DLMKNotebook.h"

@interface DLMKNote ()

// Private interface goes here.

@end

@implementation DLMKNote

// Custom logic goes here.
+(instancetype) noteWithName:(NSString*)name
                    notebook:(DLMKNotebook*) notebook
                     context:(NSManagedObjectContext*)context{
    
    DLMKNote* note = [self insertInManagedObjectContext:context];
    note.name = name;
    note.notebook = notebook;
    note.creationDate = [NSDate date];
    note.photo = [DLMKPhotoContainer insertInManagedObjectContext:context];
    note.modificationDate = [NSDate date];
    
    return note;
}

#pragma mark - Utils
-(NSArray*) observableKeys{
    return @[DLMKNoteAttributes.name, DLMKNoteAttributes.text, DLMKNoteRelationships.notebook,
             DLMKNoteRelationships.photo, @"photo.photoData"];
}

#pragma mark - KVO

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    //I am interested in knowing if something has changed
    self.modificationDate = [NSDate date];
}


@end
