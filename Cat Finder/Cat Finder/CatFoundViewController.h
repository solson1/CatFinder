//
//  CatFoundViewController.h
//  Cat Finder
//
//  Created by Jason Sheehan on 11/24/13.
//  Copyright (c) 2013 Jason Sheehan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CatCell.h"

@interface CatFoundViewController : UIViewController <UITableViewDelegate>{
    
    NSArray *catsArray;
    
}
    
@property (weak, nonatomic) IBOutlet UITableView *catsTable;


@end
