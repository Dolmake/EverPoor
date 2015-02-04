//
//  DLMKNotesViewController.m
//  EverPoor
//
//  Created by Daniel on 04/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKNotesViewController.h"
#import "DLMKNote.h"
#import "DLMKPhotoContainer.h"
#import "DLMKNotebook.h"
#import "DLMKNoteTableViewCellController.h"

@implementation DLMKNotesViewController

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
       self.title = self.notebook.name;
}
-(void) viewDidLoad{

    [super viewDidLoad];
    UIBarButtonItem *b = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNote:)];
    
    self.navigationItem.rightBarButtonItem = b;
 
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //TODO: ask for the real size
    return 100.0;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //Look up for the note
    DLMKNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Create the cell
    static NSString* CELL_ID =  @"CELL_NOTE_ID";
    
     //Custom Cell
     DLMKNoteTableViewCellController *cell = (DLMKNoteTableViewCellController*)[tableView dequeueReusableCellWithIdentifier:CELL_ID];
     
     if (!cell)
     {
         NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DLMKNoteTableViewCellController" owner:self options:nil];
         cell = [nib firstObject];
     }
    
     cell.noteModel = note;
    return cell;

    }

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        DLMKNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [self.fetchedResultsController.managedObjectContext deleteObject:note ];
    }
    
}

#pragma mark - Actions

-(void)addNote:(id)sender{
    DLMKNote *note = [DLMKNote noteWithName:@"New Note" notebook:self.notebook context:self.notebook.managedObjectContext];
}

@end
