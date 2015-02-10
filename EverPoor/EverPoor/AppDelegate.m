//
//  AppDelegate.m
//  EverPoor
//
//  Created by Daniel on 02/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "MACROS.h"
#import "SETTINGS.h"

#import "AppDelegate.h"
#import "AGTCoreDataStack.h"
#import "DLMKNote.h"
#import "DLMKNotebook.h"
#import "DLMKNotebooksViewController.h"
#import "UIViewController+Navigation.h"


@interface AppDelegate ()
@property (nonatomic, strong) AGTCoreDataStack *stack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //NSString* typeName = NSStringFromClass([DLMKNote class]);

     NSLog(NSStringize(Serializando string));
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Create the Stack
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    [self autoSave];
    
    [self createDummyData];
    
    //[self workWithData];
    
    //Create a fake Fetchrequest
    NSFetchRequest* req = [NSFetchRequest fetchRequestWithEntityName:[DLMKNotebook entityName]];
    req.fetchBatchSize = 30;
    req.sortDescriptors = @[
                            [NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)],
                             //[NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES],
                             [NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.modificationDate ascending:NO]
                            ];
    
    NSFetchedResultsController *fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:req managedObjectContext:self.stack.context sectionNameKeyPath:nil cacheName:nil ];
    
    //Create the controller and push it into a Navigation controller
    DLMKNotebooksViewController *notebookVC = [[DLMKNotebooksViewController alloc] initWithFetchedResultsController:fetchController style:UITableViewStylePlain];
//    
//    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:notebookVC];
//    
//    self.window.rootViewController = nav;
    
    self.window.rootViewController = [notebookVC dlmkWrappedInNavigation];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    [self.stack saveWithErrorBlock:^(NSError *error){
        NSLog(@"FCK!!!!");
    }];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [self.stack saveWithErrorBlock:^(NSError *error){
        NSLog(@"FCK!!!!");
    }];

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void) createDummyData{
    
    [self.stack zapAllData];
    
    DLMKNotebook *nb = [DLMKNotebook notebookWithName:@"Enemigos" context:self.stack.context];
    
    [DLMKNote noteWithName:@"Vegeta" notebook:nb context:self.stack.context];
        [DLMKNote noteWithName:@"Nappa" notebook:nb context:self.stack.context];
        [DLMKNote noteWithName:@"Radix" notebook:nb context:self.stack.context];
    
    //NSLog(@"Libreta: %@", nb);
    //NSLog(@"Foes: %@", nb.notes);
}

-(void) workWithData{
    
    DLMKNotebook *allies =[DLMKNotebook notebookWithName:@"Aliados" context:self.stack.context];
    
    DLMKNote *krillin = [DLMKNote noteWithName:@"Krillin" notebook:allies context:self.stack.context];
    
    NSLog(@"Date Before: %@" , krillin.modificationDate);
    krillin.text = @"Nooooooooooo!!!!!";
    NSLog(@"Date After: %@" , krillin.modificationDate);
    
    
    //Search for notes
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DLMKNote entityName]];
    
    req.fetchBatchSize = 20;
    req.sortDescriptors = @[
                            [NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)],
                            //[NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.name ascending:YES],
                             [NSSortDescriptor sortDescriptorWithKey:DLMKNoteAttributes.modificationDate ascending:NO]
                            ];
    
    req.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", allies ];
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:req
                                                     error:&err];
    
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
        NSLog(@"Notebook count %lu", (unsigned long) [res count]);
        NSLog(@"Notebooks: %@", res);
        
        NSLog(@"Class Type: %@", [res class]);
    }
    
    //Delete a note
    [self.stack.context deleteObject:allies];//Delete a notebook
    req.predicate = nil;
    res = [self.stack.context executeFetchRequest:req error:&err];
    if (!res){
        //Error
        NSLog(@"Error on fetchRequest %@" , err);
    }else{
       NSLog(@"Notebooks: %@", res);
    }
    
    
    //Save data
    [self.stack saveWithErrorBlock:^(NSError* error){
        NSLog(@"Error on save: %@", error);
    }];
}

#pragma mark - Autosave
-(void) autoSave{
    
    if (AUTO_SAVE){
        NSLog(@"Autosaving...");
        
        [self.stack saveWithErrorBlock:^(NSError *error){
            NSLog(@"Error at autosave! %@" , error);
        }];
        
        [self performSelector:@selector(autoSave) withObject:self afterDelay:AUTO_SAVE_DELAY];
    }
}
















@end
