//
//  DLMKNotebooksViewController.m
//  EverPoor
//
//  Created by Daniel on 04/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKNotebooksViewController.h"
#import "DLMKNotebook.h"
#import "DLMKNotesViewController.h"
#import "DLMKNote.h"
#import "DLMKNotebookTableViewCell.h"

@interface DLMKNotebooksViewController ()

@end

@implementation DLMKNotebooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"EverPoor";
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNoteBook:)];
    
    self.navigationItem.rightBarButtonItem = addBtn;
    
    //Register el nib de la celda
    UINib *nib = [UINib nibWithNibName:@"DLMKNotebookTableViewCell" bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:[DLMKNotebookTableViewCell cellId ]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //Look up for the notebook
    DLMKNotebook *notebook = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Create the cell
    NSString* CELL_ID =  [DLMKNotebookTableViewCell cellId];
    DLMKNotebookTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    
    //Setup the cell
    cell.nameView.text = notebook.name;
    cell.notesView.text = [NSString stringWithFormat:@"%lu", notebook.notes.count];
    
    /*
    NSDateFormatter * fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    cell.detailTextLabel.text = [ NSString stringWithFormat:@"%@ ( %lu notes)",
                                 [fmt stringFromDate:notebook.modificationDate], (unsigned long)notebook.notes.count];
    */
    return cell;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [DLMKNotebookTableViewCell height];
}

-(NSString*) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"Remove?";
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Lookup what was the notebook
    DLMKNotebook* notebook = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Create a fetchresults
    NSFetchRequest* req = [NSFetchRequest fetchRequestWithEntityName:[DLMKNote entityName]];
    req.fetchBatchSize = 30;
    req.sortDescriptors = @[
                            [NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)],
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES],
                            [NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.modificationDate ascending:NO]
                            ];
    
    req.predicate = [NSPredicate predicateWithFormat: @"notebook == %@", notebook];
    
    NSFetchedResultsController *fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:req managedObjectContext:self.fetchedResultsController.managedObjectContext sectionNameKeyPath:nil cacheName:nil ];
    
    //Create a Notes Controller instance
    DLMKNotesViewController *notesVC = [[DLMKNotesViewController alloc] initWithFetchedResultsController:fetchController style: UITableViewStylePlain ];
    
    notesVC.notebook = notebook;
    
    //Then push it
    [self.navigationController pushViewController:notesVC animated:YES];
}


#pragma mark - Actions

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Look up if the chicken wants to remove
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        //Remove the notebook...but What is it?
        NSManagedObjectContext *context = self.fetchedResultsController.managedObjectContext;
        
        DLMKNotebook* notebookToRemove = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [context deleteObject:notebookToRemove];
    }
    
}

-(void) addNoteBook: (id) sender{
    DLMKNotebook* notebook = [DLMKNotebook notebookWithName:@"Notebook" context:self.fetchedResultsController.managedObjectContext];
}










@end
