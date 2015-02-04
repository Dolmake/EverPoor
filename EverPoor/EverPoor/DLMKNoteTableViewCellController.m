//
//  DLMKNoteTableViewCellController.m
//  EverPoor
//
//  Created by Daniel on 04/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKNoteTableViewCellController.h"
#import "DLMKNote.h"
#import "DLMKPhotoContainer.h"

@implementation DLMKNoteTableViewCellController


-(void) setNoteModel:(DLMKNote *)noteModel{
    
    _noteModel = noteModel;
    [self syncModel];
}

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - MISC

-(void) syncModel{
    self.lbNoteTitle.text = self.noteModel.name;
    self.txNoteText.text = self.noteModel.text;
    self.iPhoto.image = self.noteModel.photo.image;
}

@end
