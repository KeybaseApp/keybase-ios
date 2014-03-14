//
//  PGPKUserCell.m
//  Keybase
//
//  Created by App Requests on 3/13/14.
//  Copyright (c) 2014 Turboe Creations. All rights reserved.
//

#import "PGPKUserCell.h"

@implementation PGPKUserCell
@synthesize usernameLabel, nameLabel, githubUsernameLabel, keyLabel;

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
