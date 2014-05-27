//
//  AJNewEntryViewController.m
//  Diary
//
//  Created by Alberto Jauregui on 5/26/14.
//  Copyright (c) 2014 Alberto Jauregui. All rights reserved.
//

#import "AJNewEntryViewController.h"
#import "AJDiaryEntry.h"
#import "AJCoreDataStack.h"

@interface AJNewEntryViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AJNewEntryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)dismissSelf {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)insertDiaryEntry {
    AJCoreDataStack *coreDataStack = [AJCoreDataStack defaultStack];
    AJDiaryEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"AJDiaryEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
    entry.body = self.textField.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    [coreDataStack saveContext];
}

- (IBAction)doneWasPressed:(id)sender {
    [self insertDiaryEntry];
    [self dismissSelf];
}
- (IBAction)cancelWasPressed:(id)sender {
    [self dismissSelf];
}

@end
