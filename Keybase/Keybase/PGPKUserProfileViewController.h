//
//  PGPKUserProfileViewController.h
//  Keybase
//
//  Created by App Requests on 3/14/14.
//  Copyright (c) 2014 Turboe Creations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface PGPKUserProfileViewController : UIViewController
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong, nonatomic) IBOutlet UILabel *githubUsername;
@property (strong, nonatomic) IBOutlet UILabel *twitterUsernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *fullnameLabel;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UITextView *bioTextField;
@property (strong, nonatomic) IBOutlet NSDictionary *userData;

-(void)setUsername:(NSString *)username;

@end
