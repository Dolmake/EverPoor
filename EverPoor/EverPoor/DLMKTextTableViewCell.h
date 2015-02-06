//
//  DLMKTextTableViewCell.h
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKNote;

@interface DLMKTextTableViewCell : UITableViewCell

+(CGFloat)height;
+(NSString*)cellId;


@property (weak, nonatomic) IBOutlet UITextView* textView;

@property (strong, nonatomic) DLMKNote* note;



@end
