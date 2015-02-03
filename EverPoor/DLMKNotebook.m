#import "DLMKNotebook.h"

@interface DLMKNotebook ()

// Private interface goes here.

@end

@implementation DLMKNotebook

// Custom logic goes here.
+(instancetype) notebookWithName: (NSString*)name
                         context: (NSManagedObjectContext*)context{
    
    DLMKNotebook* notebook = [self insertInManagedObjectContext:context];
    notebook.name = name;
    notebook.creationDate = [NSDate date];
    notebook.modificationDate = [NSDate date];
    
    return notebook;
}

#pragma mark - Utils
-(NSArray*) observableKeys{
    return @[DLMKNotebookAttributes.name, DLMKNotebookRelationships.notes ];
}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    //I am interested in knowing if something has changed
    self.modificationDate = [NSDate date];
}

@end










