//
//  CatSubmitViewController.h
//  Cat Finder
//
//  Created by Jason Sheehan on 11/24/13.
//  Copyright (c) 2013 Jason Sheehan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CatSubmitViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *catLocationField;
- (IBAction)catSubmitButton:(id)sender;

@end
