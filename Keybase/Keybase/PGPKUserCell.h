//
//  PGPKUserCell.h
//  Keybase
//
//  Created by App Requests on 3/13/14.
//  Copyright (c) 2014 Turboe Creations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGPKUserCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *keyLabel;
@property (strong, nonatomic) IBOutlet UILabel *githubUsernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@end
