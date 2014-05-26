//
//  AJDiaryEntry.h
//  Diary
//
//  Created by Alberto Jauregui on 5/26/14.
//  Copyright (c) 2014 Alberto Jauregui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ENUM(int16_t, AJDiaryEntryMood) {
    AJDiaryEntryMoodGood = 0,
    AJDiaryEntryMoodAverage = 1,
    AJDiaryEntryMoodBad = 2
};

@interface AJDiaryEntry : NSManagedObject

@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic) int16_t mood;
@property (nonatomic, retain) NSString * location;

@end
