//
//  RCWRootViewController.m
//  TestingInXcode5-Storyboards
//
//  Created by Jonathan on 10/1/13.
//  Copyright (c) 2013 Rubber City Wizards, Ltd. All rights reserved.
//

#import "RCWRootViewController.h"
#import "RCWTimeIntervalFormatter.h"

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
    RCWTimeIntervalFormatter *tif = [[RCWTimeIntervalFormatter alloc] init];
    NSTimeInterval interval = 0-[self.timeOfLastTap timeIntervalSinceNow];
    NSString *formatted = [tif stringFromTimeInterval:interval];
    NSString *message = [NSString stringWithFormat:@"Last pressed %@ ago", formatted];
    self.elapsedLabel.text = message;
}

@end
