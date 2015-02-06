//
//  DLMKTextTableViewCell.m
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKTextTableViewCell.h"
#import "DLMKNote.h"
#import "MACROS.h"

@implementation DLMKTextTableViewCell

#pragma mark - Properties
-(void) setNote:(DLMKNote *)note{
   
    
    //Save the note
    _note = note;
    
    //Synchronize the view with the note
    self.textView.text = note.text;
    
}

#pragma mark - Class methods
+(CGFloat)height{
    return 320.0f;
}
+(NSString*)cellId{
    return [self description];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
