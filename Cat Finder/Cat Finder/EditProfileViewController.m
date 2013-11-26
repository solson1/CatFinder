//
//  EditProfileViewController.m
//  Cat Finder
//
//  Created by Jason Sheehan on 11/23/13.
//  Copyright (c) 2013 Jason Sheehan. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

@synthesize genderPicker;
@synthesize genderArray;
@synthesize preferencePicker;
@synthesize preferenceArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    genderPicker.delegate = self;
    genderPicker.dataSource = self;
    preferencePicker.delegate = self;
    preferencePicker.dataSource = self;
    
    genderArray = [[NSArray alloc]initWithObjects:@"Male",@"Female", nil];
    preferenceArray = [[NSArray alloc]initWithObjects:@"Male",@"Female", nil];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if([pickerView isEqual:genderPicker]){
        return 1;
    }
    else if([pickerView isEqual:preferencePicker]){
        return 1;
    }
    else{
        return 0;
    }
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if([pickerView isEqual:genderPicker]){
        return [genderArray count];
    }
    else if([pickerView isEqual:preferencePicker]){
        return [preferenceArray count];
    }
    else{
        return 0;
    }
    
}


- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 30.0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if([pickerView isEqual:genderPicker]){
        return [genderArray objectAtIndex:row];
}
    else if([pickerView isEqual:preferencePicker]){
        return [preferenceArray objectAtIndex:row];
    }
    else{
        return 0;
    }
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    /*NSLog(@"%@",[genderArray objectAtIndex:row]);
    NSLog(@"%@",[preferenceArray objectAtIndex:row]);*/
    PFUser *User1 = [PFUser currentUser];
    [User1 setObject:[genderArray objectAtIndex:row] forKey:@"Gender"];
    [User1 saveInBackground];
    [User1 setObject:[preferenceArray objectAtIndex:row] forKey:@"interestedIn"];
    [User1 saveInBackground];
}







-(IBAction)ReturnKeyButton:(id)sender {
    
    [sender resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}

- (IBAction)logoutButton:(id)sender {
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)updateProfileButton:(id)sender {
    PFUser *newUser = [PFUser currentUser];
    [newUser setObject:_ageField.text forKey:@"age"];
    [newUser saveInBackground];
}

@end
