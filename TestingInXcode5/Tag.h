//
//  Tag.h
//  TestingInXcode5
//
//  Created by Jonathan on 10/1/13.
//  Copyright (c) 2013 Rubber City Wizards, Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class JournalEntry;

@interface Tag : NSManagedObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSSet *journalEntries;
@end

@interface Tag (CoreDataGeneratedAccessors)

- (void)addJournalEntriesObject:(JournalEntry *)value;
- (void)removeJournalEntriesObject:(JournalEntry *)value;
- (void)addJournalEntries:(NSSet *)values;
- (void)removeJournalEntries:(NSSet *)values;

@end
