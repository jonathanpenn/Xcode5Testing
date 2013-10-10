//
//  RCWTimeIntervalFormatter.m
//  TestingInXcode5
//
//  Created by Jonathan on 10/9/13.
//  Copyright (c) 2013 Rubber City Wizards, Ltd. All rights reserved.
//

#import "RCWTimeIntervalFormatter.h"

@implementation RCWTimeIntervalFormatter {
    NSCalendar *_calendar;
    NSNumberFormatter *_numberFormatter;
}

- (id)init {
    self = [super init];
    if (self) {
        _calendar = [NSCalendar currentCalendar];

        _numberFormatter = [[NSNumberFormatter alloc] init];
        [_numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [_numberFormatter setRoundingMode:NSNumberFormatterRoundHalfUp];
        [_numberFormatter setMaximumFractionDigits:0];
    }
    return self;
}

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval {
    NSUInteger unitFlags = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [_calendar components:unitFlags
                                                fromDate:[NSDate date]
                                                  toDate:[NSDate dateWithTimeIntervalSinceNow:interval]
                                                 options:0];

    NSMutableArray *parts = [NSMutableArray array];;

    [self addComponentIfPresent:[components day] withSuffix:@"d" toParts:parts];
    [self addComponentIfPresent:[components hour] withSuffix:@"h" toParts:parts];
    [self addComponentIfPresent:[components minute] withSuffix:@"m" toParts:parts];
    [self addComponentIfPresent:[components second] withSuffix:@"s" toParts:parts];

    if ([parts count] == 0) { return @"0s"; }

    return [parts componentsJoinedByString:@" "];
}

- (void)addComponentIfPresent:(NSUInteger)component
                       withSuffix:(NSString *)suffix
                     toParts:(NSMutableArray *)parts {
    if (component > 0) {
        [parts addObject:[NSString stringWithFormat:@"%@%@",
                             [_numberFormatter stringFromNumber:@(component)],
                             suffix]];
    }
}

@end
