//
//  PMAppDelegate.h
//  PasswordManager
//
//  Created by Pan Pan on 10/25/12.
//  Copyright (c) 2012 Pan Pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
