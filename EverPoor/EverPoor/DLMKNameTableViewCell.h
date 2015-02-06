//
//  DLMKNameTableViewCell.h
//  EverPoor
//
//  Created by Daniel on 05/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKNote;

@interface DLMKNameTableViewCell : UITableViewCell

+(CGFloat)height;
+(NSString*)cellId;

@property (weak, nonatomic) IBOutlet UITextField* txNameField;
@property (nonatomic,strong) DLMKNote* note;


@end
