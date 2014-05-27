//
//  AJNewEntryViewController.m
//  Diary
//
//  Created by Alberto Jauregui on 5/26/14.
//  Copyright (c) 2014 Alberto Jauregui. All rights reserved.
//

#import "AJEntryViewController.h"
#import "AJDiaryEntry.h"
#import "AJCoreDataStack.h"

@interface AJEntryViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AJEntryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(self.entry != nil){
        self.textField.text = self.entry.body;
    }
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

- (void)updateDiaryEntry {
    self.entry.body = self.textField.text;
    AJCoreDataStack *coreDataStack = [AJCoreDataStack defaultStack];
    [coreDataStack saveContext];
}

- (IBAction)doneWasPressed:(id)sender {
    if (self.entry != nil) {
        [self updateDiaryEntry];
    }else{
        [self insertDiaryEntry];
    }
    [self dismissSelf];
}
- (IBAction)cancelWasPressed:(id)sender {
    [self dismissSelf];
}

@end
