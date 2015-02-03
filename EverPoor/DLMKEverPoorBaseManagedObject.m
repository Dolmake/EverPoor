//
//  DLMKEverPoorBaseManagedObject.m
//  EverPoor
//
//  Created by Daniel on 03/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKEverPoorBaseManagedObject.h"

@implementation DLMKEverPoorBaseManagedObject





#pragma mark - Lifecycle
-(void) awakeFromInsert{
    [super awakeFromInsert];
    //Invoked only once in the whole life
    [self setupKVO];
}

-(void) awakeFromFetch{
    [super awakeFromFetch];
    //Invoked several times
    [self setupKVO];
}

-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    [self tearDownKVO];
}

#pragma mark - Utils
-(NSArray*) observableKeys{
    return nil;
}

#pragma mark - KVO
-(void) setupKVO{
    
    for(NSString* key in [self observableKeys])
    {
        //Subscribe  in notifications. One per Property
        [self addObserver:self
               forKeyPath:key
                  //options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  options:0
                  context:NULL];
    }
}

-(void) tearDownKVO{
    for(NSString* key in [self observableKeys])
    {
        //Subscribe  in notifications. One per Property
        [self removeObserver:self forKeyPath:key];
    }
}







@end
