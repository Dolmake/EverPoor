#import "_DLMKNotebook.h"

@interface DLMKNotebook : _DLMKNotebook {}
// Custom logic goes here.

+(instancetype) notebookWithName: (NSString*)name
                         context: (NSManagedObjectContext*)context;
@end
