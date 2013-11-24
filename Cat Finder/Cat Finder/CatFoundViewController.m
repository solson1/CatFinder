//
//  CatFoundViewController.m
//  Cat Finder
//
//  Created by Jason Sheehan on 11/24/13.
//  Copyright (c) 2013 Jason Sheehan. All rights reserved.
//

#import "CatFoundViewController.h"

@interface CatFoundViewController ()

@end

@implementation CatFoundViewController

@synthesize catsTable;

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
    
    [self performSelector:@selector(retrieveFromParse)];
}

- (void) retrieveFromParse {
    PFQuery *retrieveCatLocation = [PFQuery queryWithClassName:@"CatLocation"];
    
    [retrieveCatLocation findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            catsArray = [[NSArray alloc] initWithArray:objects];
        }
        [catsTable reloadData];
    }];
    
}

//get number of sections in tableView from cats array
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //Return the number of sections.
    return 1;
}

//get number of rows by counting number of cats
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return catsArray.count;
}

//setup cells in tableView
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //setup cell
    static NSString *CellIdentifier = @"catListCell";
    CatCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary *tempObject = [catsArray objectAtIndex:indexPath.row];
    cell.catLocation.text = [tempObject objectForKey:@"Location"];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
