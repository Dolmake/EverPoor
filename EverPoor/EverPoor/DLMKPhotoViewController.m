//
//  DLMKPhotoViewController.m
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKPhotoViewController.h"
#import "DLMKNote.h"
#import "DLMKPhotoContainer.h"

@interface DLMKPhotoViewController ()

@property (strong, nonatomic) DLMKNote* note;

@end

@implementation DLMKPhotoViewController

-(id) initWithModel:(DLMKNote*) model{
    if (self = [super initWithNibName:nil bundle:nil]){
        _note = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewWillAppear:(BOOL)animated{
    
    //Set the photo
    self.photoView.image = self.note.photo.image;
}

-(void) viewWillDisappear:(BOOL)animated{
    self.note.photo.image = self.photoView.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
