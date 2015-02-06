//
//  DLMKNotebookTableViewCell.m
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKNotebookTableViewCell.h"

@implementation DLMKNotebookTableViewCell

+(CGFloat)height{
    return 60.0;
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
