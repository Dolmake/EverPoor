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
#import "DLMKNoteViewController.h"

@implementation DLMKNotesViewController

-(void) viewWillAppear:(BOOL)animated{
       self.title = self.notebook.name;
}
-(void) viewDidLoad{

    UIBarButtonItem *b = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNote:)];
    
    self.navigationItem.rightBarButtonItem = b;
 
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //Look up for the note
    DLMKNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Create the cell
    static NSString* CELL_ID =  @"CELL_NOTE_ID";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_ID ];
    }
    
    //Setup the cell
    cell.textLabel.text = note.name;
    cell.imageView.image = note.photo.image;
    
    NSDateFormatter * fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    cell.detailTextLabel.text = [ NSString stringWithFormat:@"%@",
                                 [fmt stringFromDate:note.modificationDate]];
    
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


#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //Lookup the proper note
    DLMKNote* note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Create the Note Form
    DLMKNoteViewController* nVC = [[DLMKNoteViewController alloc] initWithModel:note ];
    
    
    //Do the push
    [self.navigationController pushViewController:nVC animated:YES];
}









@end
