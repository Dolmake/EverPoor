//
//  DLMKEverPoorBaseManagedObject.h
//  EverPoor
//
//  Created by Daniel on 03/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import CoreData;

@interface DLMKEverPoorBaseManagedObject : NSManagedObject

-(NSArray*) observableKeys;
-(void) setupKVO;
-(void) tearDownKVO;

@end
