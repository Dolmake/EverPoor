//
//  DLMKNoteViewControllerTableViewController.h
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//
@import UIKit;
#import "DLMKNote.h"

@interface DLMKNoteViewController : UITableViewController


@property (strong, nonatomic) DLMKNote* note;
-(id) initWithModel: (DLMKNote*) model;

 @end
