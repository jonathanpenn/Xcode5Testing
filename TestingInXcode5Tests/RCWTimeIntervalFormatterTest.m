//
//  RCWTimeIntervalFormatterTest.m
//  TestingInXcode5
//
//  Created by Jonathan on 10/9/13.
//  Copyright (c) 2013 Rubber City Wizards, Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RCWTimeIntervalFormatter.h"

@interface RCWTimeIntervalFormatterTest : XCTestCase
@property (nonatomic, strong) RCWTimeIntervalFormatter *formatter;
@end

@implementation RCWTimeIntervalFormatterTest

- (void)setUp {
    [super setUp];
    self.formatter = [[RCWTimeIntervalFormatter alloc] init];
}

- (void)testZeroSeconds {
    NSString *output = [self.formatter stringFromTimeInterval:0];
    XCTAssertEqualObjects(output, @"0s");
}

- (void)test10Seconds {
    NSString *output = [self.formatter stringFromTimeInterval:10];
    XCTAssertEqualObjects(output, @"10s");
}

- (void)test3Minutes10Seconds {
    NSString *output = [self.formatter stringFromTimeInterval:3 * 60 + 10];
    XCTAssertEqualObjects(output, @"3m 10s");
}

- (void)test3Minutes {
    NSString *output = [self.formatter stringFromTimeInterval:3 * 60];
    XCTAssertEqualObjects(output, @"3m");
}

- (void)test2Hours20Seconds {
    NSString *output = [self.formatter stringFromTimeInterval:2 * 60 * 60 + 20];
    XCTAssertEqualObjects(output, @"2h 20s");
}

- (void)test9336Days3Hours20Minutes10Seconds {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = 9336;
    dateComponents.hour = 3;
    dateComponents.minute = 20;
    dateComponents.second = 10;
    NSDate *future = [calendar dateByAddingComponents:dateComponents toDate:now options:0];
    NSTimeInterval interval = [future timeIntervalSinceDate:now];

    NSString *output = [self.formatter stringFromTimeInterval:interval];
    XCTAssertEqualObjects(output, @"9,336d 3h 20m 10s");
}

@end
