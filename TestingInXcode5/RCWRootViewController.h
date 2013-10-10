//
//  RCWRootViewController.h
//  TestingInXcode5-Storyboards
//
//  Created by Jonathan on 10/1/13.
//  Copyright (c) 2013 Rubber City Wizards, Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCWRootViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *elapsedLabel;

- (IBAction)buttonTapped:(id)sender;

@end
