//
//  AJEntryCell.m
//  Diary
//
//  Created by Alberto Jauregui on 5/26/14.
//  Copyright (c) 2014 Alberto Jauregui. All rights reserved.
//

#import "AJEntryCell.h"
#import "AJDiaryEntry.h"

@implementation AJEntryCell

+ (CGFloat)heightForEntry:(AJDiaryEntry *)entry {
    const CGFloat topMargin = 35.0f;
    const CGFloat bottomMargin = 39.0f;
    const CGFloat minHeight = 85.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [entry.body boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) +topMargin + bottomMargin);
}

@end
