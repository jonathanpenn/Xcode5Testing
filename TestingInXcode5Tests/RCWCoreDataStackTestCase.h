//
//  RCWCoreDataStackTestCase.h
//  TestingInXcode5
//
//  Created by Jonathan on 10/10/13.
//  Copyright (c) 2013 Rubber City Wizards, Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "JournalEntry.h"
#import "Tag.h"

@interface RCWCoreDataStackTestCase : XCTestCase

@property (nonatomic, strong) NSManagedObjectContext *context;

- (JournalEntry *)makeJournalEntry;
- (Tag *)makeTag;

@end

