#import "DLMKPhotoContainer.h"

@interface DLMKPhotoContainer ()

// Private interface goes here.

@end

@implementation DLMKPhotoContainer

// Custom logic goes here.

-(UIImage*) image{
    return [UIImage imageWithData:self.photoData];
}

-(void) setImage:(UIImage *)image{
    
    self.photoData = UIImagePNGRepresentation(image);
}

@end
