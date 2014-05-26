//
//  AJCoreDataStack.h
//  Diary
//
//  Created by Alberto Jauregui on 5/26/14.
//  Copyright (c) 2014 Alberto Jauregui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJCoreDataStack : NSObject

+ (instancetype)defaultStack;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
