//
//  RCWRootViewController.m
//  TestingInXcode5-Storyboards
//
//  Created by Jonathan on 10/1/13.
//  Copyright (c) 2013 Rubber City Wizards, Ltd. All rights reserved.
//

#import "RCWRootViewController.h"

@interface RCWRootViewController ()
@property (nonatomic) NSUInteger tapCount;
@property (nonatomic) NSDate *timeOfLastTap;
@end

@implementation RCWRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateCountLabel];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.timeOfLastTap = [NSDate date];
    [self updateElapsedLabel];
}

- (IBAction)buttonTapped:(id)sender {
    self.tapCount++;
    [self updateCountLabel];
    [self updateElapsedLabel];
    self.timeOfLastTap = [NSDate date];
}

- (void)updateCountLabel {
    self.countLabel.text = [NSString stringWithFormat:@"tapped: %lu", (unsigned long)self.tapCount];
}

- (void)updateElapsedLabel {
    NSTimeInterval fullSeconds = 0-[self.timeOfLastTap timeIntervalSinceNow];
    NSUInteger minutes = round(fullSeconds / 60);
    NSUInteger seconds = round(fullSeconds - minutes * 60);

    NSString *message = [NSString stringWithFormat:@"Last pressed %dm %ds ago",
                         minutes, seconds];

    self.elapsedLabel.text = message;
}

@end
