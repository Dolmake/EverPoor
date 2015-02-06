//
//  DLMKNoteViewControllerTableViewController.m
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#define NUMBER_OF_SECTIONS 4

#define NAME_SECTION_HEADER @"Name"
#define DATES_SECTION_HEADER  @"Creation & Modification Date"
#define TEXT_SECTION_HEADER  @"Text"
#define IMAGE_SECTION_HEADER  @"Image"

#define NAME_SECTION 0
#define DATES_SECTION 1
#define TEXT_SECTION 2
#define IMAGE_SECTION 3


#import "DLMKNoteViewController.h"
#import "DLMKNote.h"
#import "MACROS.h"

#import "DLMKNotebookTableViewCell.h"
#import "DLMKPhotoTableViewCell.h"
#import "DLMKTextTableViewCell.h"
#import "DLMKDatesTableViewCell.h"
#import "DLMKNameTableViewCell.h"
#import "DLMKPhotoViewController.h"

@interface DLMKNoteViewController ()

@end

@implementation DLMKNoteViewController

-(id) initWithModel: (DLMKNote*) model{
    
    if (self = [super initWithNibName:nil bundle:nil]){
        _note = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self registerNibs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (indexPath.section) {
        case NAME_SECTION:
            return [self cell:[DLMKNameTableViewCell class] tableView:tableView ];
            break;
        case DATES_SECTION:
             return [self cell:[DLMKDatesTableViewCell class]  tableView:tableView ];
            break;
        case TEXT_SECTION:
             return [self cell:[DLMKTextTableViewCell class]  tableView:tableView ];
            break;
        case IMAGE_SECTION:
            return [self cell:[DLMKPhotoTableViewCell class]  tableView:tableView ];
            break;
            
        default:
            return nil;
            break;
    }
  
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    switch (indexPath.section) {
        case NAME_SECTION:
            return [DLMKNameTableViewCell height];
            break;
        case DATES_SECTION:
            return [DLMKDatesTableViewCell height] ;
            break;
        case TEXT_SECTION:
            return [DLMKTextTableViewCell height];
            break;
        case IMAGE_SECTION:
            return [DLMKPhotoTableViewCell height] ;
            break;
            
        default:
            return 0.0f;
            break;
    }

    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == IMAGE_SECTION){
        
        //Show the PhotoViewController
        DLMKPhotoViewController *photoVC = [[DLMKPhotoViewController alloc] initWithModel:self.note ];
        
        [self.navigationController pushViewController:photoVC animated:YES];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case NAME_SECTION:
            return NAME_SECTION_HEADER;
            break;
        case DATES_SECTION:
            return DATES_SECTION_HEADER;
            break;
        case TEXT_SECTION:
            return TEXT_SECTION_HEADER;
            break;
        case IMAGE_SECTION:
            return IMAGE_SECTION_HEADER;
            break;
            
        default:
            return nil;
            break;
    }
    
}


-(void) registerNibs{
    [self registerNib:[DLMKNotebookTableViewCell class]];
    [self registerNib:[DLMKPhotoTableViewCell class]];
    [self registerNib:[DLMKTextTableViewCell class]];
    [self registerNib:[DLMKDatesTableViewCell class]];
    [self registerNib:[DLMKNameTableViewCell class]];
}


-(void) registerNib: (id)type{
    
    NSString* typeName = NSStringFromClass(type);
    //NSString* typeName =NSStringize(type);
    UINib *nameNib = [ UINib nibWithNibName:typeName bundle:[NSBundle mainBundle] ];
    
    [self.tableView registerNib:nameNib forCellReuseIdentifier:[type performSelector:@selector(cellId)]];
}

-(UITableViewCell*) cell:(id)type tableView:( UITableView*) tableView {
    
    NSString* reusableId = [type performSelector:@selector(cellId)];
    UITableViewCell* result = [tableView dequeueReusableCellWithIdentifier:reusableId];
    
    //DLMKNote* note = self.note;
    //[result performSelector:@selector(setNote)];
    [result setValue:self.note forKey:@"note"];
    
    return result;
}

















@end
