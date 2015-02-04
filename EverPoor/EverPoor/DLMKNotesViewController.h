//
//  DLMKNotesViewController.h
//  EverPoor
//
//  Created by Daniel on 04/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
@class DLMKNotebook;

@interface DLMKNotesViewController : AGTCoreDataTableViewController

@property (strong, nonatomic) DLMKNotebook* notebook;

@end
