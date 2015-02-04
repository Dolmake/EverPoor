//
//  DLMKNoteTableViewCellController.h
//  EverPoor
//
//  Created by Daniel on 04/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKNote;

@interface DLMKNoteTableViewCellController : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbNoteTitle;
@property (weak, nonatomic) IBOutlet UITextView* txNoteText;
@property (weak, nonatomic) IBOutlet UIImageView *iPhoto;

@property (strong, nonatomic) DLMKNote* noteModel;

@end
