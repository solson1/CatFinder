//
//  CatCell.m
//  Cat Finder
//
//  Created by Jason Sheehan on 11/24/13.
//  Copyright (c) 2013 Jason Sheehan. All rights reserved.
//

#import "CatCell.h"

@implementation CatCell

@synthesize catLocation;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
