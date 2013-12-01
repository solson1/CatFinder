//
//  LoginViewController.m
//  Cat Finder
//
//  Created by Jason Sheehan on 11/23/13.
//  Copyright (c) 2013 Jason Sheehan. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)ReturnKeyButton:(id)sender {
    
    [sender resignFirstResponder];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    PFUser *user = [PFUser currentUser];
    if (user.username != nil){
        [self performSegueWithIdentifier:@"login" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerAction:(id)sender {
    [_usernameField resignFirstResponder];
    [_firstNameField resignFirstResponder];
    [_lastNameField resignFirstResponder];
    [_emailField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_ageField resignFirstResponder];
    [_genderField resignFirstResponder];
    [_reEnterPasswordField resignFirstResponder];
    [self checkFieldComplete];
}


- (void) checkFieldComplete {
    if ([_usernameField.text isEqualToString:@""] || [_firstNameField.text isEqualToString:@""] || [_lastNameField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"You need to complete all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self checkPasswordsMatch];
    }
}

- (void) checkPasswordsMatch {
    if (![_passwordField.text isEqualToString:_reEnterPasswordField.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Passwords don't match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self registerNewUser];
    }
}

- (void) registerNewUser {
    PFUser *newUser = [PFUser user];
    newUser.username = _usernameField.text;
    newUser.email = _emailField.text;
    newUser.password = _passwordField.text;
    [newUser setObject:_firstNameField.text forKey:@"firstName"];
    [newUser setObject:_lastNameField.text forKey:@"lastName"];
    
    [newUser setObject:_ageField.text forKey:@"ageString"];
    [newUser setObject:_genderField.text forKey:@"gender"];
    //first and last name into UserProfile class
   /* PFObject *userProfileObject = [PFObject objectWithClassName:@"UserProfile"];
    [userProfileObject setObject:_firstNameField.text forKey:@"firstName"];
    [userProfileObject setObject:_lastNameField.text forKey:@"lastName"];
    [userProfileObject save];*/
    
    
    
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (!error) {
            NSLog(@"Registration success!");
            _loginPasswordField.text = nil;
            _loginUsernameField.text = nil;
            _usernameField.text = nil;
            _firstNameField.text = nil;
            _lastNameField.text = nil;
            _emailField.text = nil;
            _passwordField.text = nil;
            _reEnterPasswordField.text = nil;
            _ageField.text = nil;
            _genderField.text = nil;
            [self performSegueWithIdentifier:@"login" sender:self];
            
            
            //connect first and last name to userId
            //[userProfileObject addUniqueObject:[PFUser currentUser].objectId forKey:@"userId"];
           // [userProfileObject save];
            
        }
        else {
            NSLog(@"There was an error in registration");
        }
    }];
}

- (IBAction)registeredButton:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _loginOverlayView.frame = self.view.frame;
    }];}

- (IBAction)loginButton:(id)sender {
    [PFUser logInWithUsernameInBackground:_loginUsernameField.text password:_loginPasswordField.text block:^(PFUser *user, NSError *error) {
        if (!error) {
            NSLog(@"Please Login!");
            _loginPasswordField.text = nil;
            _loginUsernameField.text = nil;
            _usernameField.text = nil;
            _firstNameField.text = nil;
            _lastNameField.text = nil;
            _passwordField.text = nil;
            _reEnterPasswordField.text = nil;
            
            [self performSegueWithIdentifier:@"login" sender:self];
            
        }
        if(error) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Sorry, issue logging in" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];
}

    
@end
