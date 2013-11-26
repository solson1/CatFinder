//
//  EditProfileViewController.h
//  Cat Finder
//
//  Created by Jason Sheehan on 11/23/13.
//  Copyright (c) 2013 Jason Sheehan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditProfileViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

- (IBAction)logoutButton:(id)sender;


@property (nonatomic, strong) NSArray *genderArray;
@property (weak, nonatomic) IBOutlet UIPickerView *genderPicker;

@property (nonatomic, strong) NSArray *preferenceArray;
@property (weak, nonatomic) IBOutlet UIPickerView *preferencePicker;


@property (weak, nonatomic) IBOutlet UITextField *ageField;
- (IBAction)updateProfileButton:(id)sender;
@end
