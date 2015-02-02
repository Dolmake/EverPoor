#import "_DLMKNote.h"
@class DLMKNotebook;

@interface DLMKNote : _DLMKNote {}
// Custom logic goes here.

+(instancetype) noteWithName:(NSString*)name
                    notebook:(DLMKNotebook*) notebook
                     context:(NSManagedObjectContext*)context;

@end
