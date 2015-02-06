//
//  DLMKDatesTableViewCell.h
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKNote;

@interface DLMKDatesTableViewCell : UITableViewCell


+(CGFloat)height;
+(NSString*)cellId;


@property (weak, nonatomic) IBOutlet UILabel* lbModificationDate;
@property (weak, nonatomic) IBOutlet UILabel* lbCreationDate;

@property (strong, nonatomic) DLMKNote* note;



@end
