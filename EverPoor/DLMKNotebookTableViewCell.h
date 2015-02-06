//
//  DLMKNotebookTableViewCell.h
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;

@interface DLMKNotebookTableViewCell : UITableViewCell

@property (weak,nonatomic) IBOutlet UILabel *nameView;
@property (weak,nonatomic) IBOutlet UILabel *notesView;

+(CGFloat)height;
+(NSString*)cellId;

@end
