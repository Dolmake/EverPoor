//
//  DLMKNameTableViewCell.m
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKNameTableViewCell.h"
#import "DLMKNote.h"
#import "MACROS.h"

@interface DLMKNameTableViewCell()




@end

@implementation DLMKNameTableViewCell

#pragma mark - Properties
-(void) setNote:(DLMKNote *)note{
    
    //Save the note
    _note = note;
    
    //Synchronize the view with the note
    self.txNameField.text = note.name;
}

#pragma mark - Class Methods
+(CGFloat)height{
    return 44.0f;
}
+(NSString*)cellId{
    return [self description];
}



-(void) prepareForReuse{

    //Is invoked everty time the cell disappear
    [super prepareForReuse];
    
    if (!isEmpty(self.txNameField.text)){
        //Synchonize the note with the view
        self.note.name = self.txNameField.text;
    }
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
