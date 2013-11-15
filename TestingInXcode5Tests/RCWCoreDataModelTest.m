//
//  RCWCoreDataModelTest.m
//  TestingInXcode5
//
//  Created by Jonathan on 10/10/13.
//  Copyright (c) 2013 Rubber City Wizards, Ltd. All rights reserved.
//

#import "RCWCoreDataStackTestCase.h"

@interface RCWCoreDataModelTest : RCWCoreDataStackTestCase

@end

@implementation RCWCoreDataModelTest

- (void)testJournalEntries {
    NSError *error = nil;

    JournalEntry *entry = [self makeJournalEntry];

    XCTAssertFalse([self.context save:&error], @"should not save");
    XCTAssertEqual(error.code, (NSInteger)1560, @"expecting validation errors");

    entry.title = @"Some title";
    entry.body = @"Some body";
    entry.when = [NSDate date];

    XCTAssert([self.context save:&error], @"Error saving: %@", error);
}

- (void)testFindByTags {
    NSError *error = nil;
    JournalEntry *entry = [self makeJournalEntry];
    entry.title = @"Some title";
    entry.body = @"Some body";
    entry.when = [NSDate date];

    Tag *tag = [self makeTag];
    tag.name = @"family";
    [tag addJournalEntriesObject:entry];

    entry = [self makeJournalEntry];
    entry.title = @"Other title";
    entry.body = @"Other body";
    entry.when = [NSDate date];

    XCTAssert([self.context save:&error], @"Error saving: %@", error);

    // Clear out all cached objects
    [self.context reset];

    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"JournalEntry"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"%@ in tags.name", @"family"]];

    NSArray *results = [self.context executeFetchRequest:request error:&error];

    XCTAssertNotNil(results, @"Expected results, error: %@", error);
    XCTAssertEqual([results count], (NSUInteger)1);
    entry = results[0];
    XCTAssertEqualObjects(entry.title, @"Some title");
}

@end
