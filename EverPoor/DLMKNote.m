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

@end
