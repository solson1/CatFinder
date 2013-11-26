//
//  CatSubmitViewController.m
//  Cat Finder
//
//  Created by Jason Sheehan on 11/24/13.
//  Copyright (c) 2013 Jason Sheehan. All rights reserved.
//

#import "CatSubmitViewController.h"

@interface CatSubmitViewController ()

@end

@implementation CatSubmitViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)catSubmitButton:(id)sender {
    PFObject *catLocationObject = [PFObject objectWithClassName:@"CatLocation"];
    [catLocationObject setObject:_catLocationField.text forKey:@"Location"];
    [catLocationObject save];
      
     
    
}
@end
