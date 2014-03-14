//
//  PGPKUserProfileViewController.m
//  Keybase
//
//  Created by App Requests on 3/14/14.
//  Copyright (c) 2014 Turboe Creations. All rights reserved.
//

#import "PGPKUserProfileViewController.h"
#include <QuartzCore/QuartzCore.h>
#import "PGPKGlobals.h"

@interface PGPKUserProfileViewController ()

@end

@implementation PGPKUserProfileViewController
@synthesize username, usernameLabel, fullnameLabel, locationLabel, bioTextField, twitterUsernameLabel, githubUsername, userData, profileImage;

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
    profileImage.layer.cornerRadius = profileImage.frame.size.height /2;
    profileImage.layer.masksToBounds = YES;
    profileImage.layer.borderWidth = 0;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"%@user/lookup.json?username=%@", apiBaseURL, username] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        userData = [responseObject objectForKey:@"them"];
        NSDictionary *profileData = [userData objectForKey:@"profile"];
        fullnameLabel.text = [profileData objectForKey:@"full_name"];
       // githubUsername.text = [profileData objectForKey:@"github"];
       // twitterUsernameLabel.text = [profileData objectForKey:@"twitter"];
        bioTextField.text = [profileData objectForKey:@"bio"];
        locationLabel.text = [profileData objectForKey:@"location"];
        self.navigationController.navigationBar.topItem.title = [profileData objectForKey:@"full_name"];
        usernameLabel.text = username;
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"Username: %@", username);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUsername:(NSString *)passedUsername {
    username = passedUsername;
}

@end
