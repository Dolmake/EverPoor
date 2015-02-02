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

#pragma mark - Lifecycle
-(void) awakeFromInsert{
    [super awakeFromInsert];
    //Invoked only once in the whole life
    [self setupKVO];
}

-(void) awakeFromFetch{
    [super awakeFromFetch];
    //Invoked several times
    [self setupKVO];
}

-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    [self tearDownKVO];
}

#pragma mark - Utils
-(NSArray*) observableKeys{
    return @[DLMKNotebookAttributes.name, DLMKNotebookRelationships.notes ];
}

#pragma mark - KVO
-(void) setupKVO{
    
    for(NSString* key in [self observableKeys])
    {
    //Subscribe  in notifications. One per Property
    [self addObserver:self
           forKeyPath:key
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:NULL];
    }
}

-(void) tearDownKVO{
    for(NSString* key in [self observableKeys])
    {
        //Subscribe  in notifications. One per Property
        [self removeObserver:self forKeyPath:key];
    }
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    //I am interested in knowing if something has changed
    self.modificationDate = [NSDate date];
}

@end










