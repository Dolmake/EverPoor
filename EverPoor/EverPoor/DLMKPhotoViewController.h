//
//  DLMKPhotoViewController.h
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKNote;

@interface DLMKPhotoViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView* photoView;
-(IBAction)deletePhoto:(id)sender;
-(IBAction)takePhoto:(id)sender;
-(IBAction)ventigify:(id)sender;

-(id) initWithModel: (DLMKNote*) model;
@end
