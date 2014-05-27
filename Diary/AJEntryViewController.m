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
@property (nonatomic, assign) enum AJDiaryEntryMood pickedMood;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIButton *badButton;
@property (weak, nonatomic) IBOutlet UIButton *averageButton;
@property (weak, nonatomic) IBOutlet UIButton *goodButton;
@property (strong, nonatomic) IBOutlet UIView *accesoryView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@end

@implementation AJEntryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDate *date;
    
    if(self.entry != nil){
        self.textView.text = self.entry.body;
        self.pickedMood = self.entry.mood;
        date = [NSDate dateWithTimeIntervalSince1970:self.entry.date];
    } else {
        self.pickedMood = AJDiaryEntryMoodGood;
        date = [NSDate date];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE MMMM d, yyyy"];
    self.dateLabel.text = [dateFormatter stringFromDate:date];
    
    self.textView.inputAccessoryView = self.accesoryView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.textView becomeFirstResponder];
}

- (void)dismissSelf {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)insertDiaryEntry {
    AJCoreDataStack *coreDataStack = [AJCoreDataStack defaultStack];
    AJDiaryEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"AJDiaryEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
    entry.body = self.textView.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    entry.mood = self.pickedMood;
    [coreDataStack saveContext];
}

- (void)updateDiaryEntry {
    self.entry.body = self.textView.text;
    self.entry.mood = self.pickedMood;
    AJCoreDataStack *coreDataStack = [AJCoreDataStack defaultStack];
    [coreDataStack saveContext];
}

- (void)setPickedMood:(enum AJDiaryEntryMood)pickedMood {
    _pickedMood = pickedMood;
    
    self.badButton.alpha = 0.5f;
    self.averageButton.alpha = 0.5f;
    self.goodButton.alpha = 0.5f;
    
    switch (pickedMood) {
        case AJDiaryEntryMoodGood:
            self.goodButton.alpha = 1.0f;
            break;
        case AJDiaryEntryMoodAverage:
            self.averageButton.alpha = 1.0f;
            break;
        case AJDiaryEntryMoodBad:
            self.badButton.alpha = 1.0f;
            break;
    }
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
- (IBAction)badWasPressed:(id)sender {
    self.pickedMood = AJDiaryEntryMoodBad;
}

- (IBAction)averageWasPressed:(id)sender {
    self.pickedMood = AJDiaryEntryMoodAverage;
}

- (IBAction)goodWasPressed:(id)sender {
    self.pickedMood = AJDiaryEntryMoodGood;
}
- (IBAction)imageButtonWasPressed:(id)sender {
}

@end
