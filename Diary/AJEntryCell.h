//
//  AJEntryCell.h
//  Diary
//
//  Created by Alberto Jauregui on 5/26/14.
//  Copyright (c) 2014 Alberto Jauregui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AJDiaryEntry;

@interface AJEntryCell : UITableViewCell

+ (CGFloat)heightForEntry:(AJDiaryEntry *)entry;

- (void)configureCellForEntry:(AJDiaryEntry *)entry;

@end
