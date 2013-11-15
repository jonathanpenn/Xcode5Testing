//
//  RCWRootViewControllerTest.m
//  TestingInXcode5
//
//  Created by Jonathan on 10/10/13.
//  Copyright (c) 2013 Rubber City Wizards, Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RCWRootViewController.h"

@interface RCWRootViewControllerTest : XCTestCase

@property (nonatomic, strong) RCWRootViewController *controller;

@end

@implementation RCWRootViewControllerTest

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle bundleForClass:[self class]]];
    self.controller = [storyboard instantiateInitialViewController];
    [self.controller view];   // Triggers the normal view lifecycle
}

- (void)testClickingButtonChangesLabel {
    XCTAssertEqualObjects(self.controller.countLabel.text, @"tapped: 0");
    [self.controller buttonTapped:nil];
    XCTAssertEqualObjects(self.controller.countLabel.text, @"tapped: 1");
    [self.controller buttonTapped:nil];
    XCTAssertEqualObjects(self.controller.countLabel.text, @"tapped: 2");
}

@end
