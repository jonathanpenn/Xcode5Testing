//
//  RCWCoreDataStackTestCase.m
//  TestingInXcode5
//
//  Created by Jonathan on 10/10/13.
//  Copyright (c) 2013 Rubber City Wizards, Ltd. All rights reserved.
//

#import "RCWCoreDataStackTestCase.h"

@implementation RCWCoreDataStackTestCase

- (void)setUp {
    [super setUp];

    NSError *error = nil;

    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:@[[NSBundle bundleForClass:[self class]]]];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSAssert([coordinator addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:&error], @"Could not initialize persistent store: %@", error);
    self.context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    self.context.persistentStoreCoordinator = coordinator;
}

- (JournalEntry *)makeJournalEntry {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"JournalEntry" inManagedObjectContext:self.context];
    JournalEntry *entry = [[JournalEntry alloc] initWithEntity:entity insertIntoManagedObjectContext:self.context];
    return entry;
}

- (Tag *)makeTag {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:self.context];
    Tag *tag = [[Tag alloc] initWithEntity:entity insertIntoManagedObjectContext:self.context];
    return tag;
}

@end
