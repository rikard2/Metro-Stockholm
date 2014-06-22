//
//  slAppDelegate.h
//  SL4Ever
//
//  Created by Rikard on 22/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface slAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
