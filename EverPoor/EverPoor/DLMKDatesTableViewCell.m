//
//  DLMKDatesTableViewCell.m
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKDatesTableViewCell.h"
#import "DLMKNote.h"

@implementation DLMKDatesTableViewCell

#pragma mark - Properties
-(void) setNote:(DLMKNote *)note{
    
    _note = note;
    [self syncNoteWithView];
    [self.note addObserver:self forKeyPath:DLMKNoteAttributes.modificationDate options:0 context:NULL];
}

-(void) prepareForReuse{
    [super prepareForReuse];
    [self.note removeObserver:self forKeyPath:DLMKNoteAttributes.modificationDate];
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    [self syncNoteWithView];
    
}

#pragma mark - Class methods
+(CGFloat)height{
    return 44.0f;
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

#pragma mark - Misc
-(void) syncNoteWithView{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init ];
    formatter.dateStyle = NSDateFormatterShortStyle;
    self.lbCreationDate.text = [formatter stringFromDate:self.note.creationDate];
    
    formatter.dateStyle = NSDateIntervalFormatterLongStyle;
    self.lbModificationDate.text = [formatter stringFromDate:self.note.modificationDate];
}







@end
