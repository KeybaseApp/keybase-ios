//
//  PGPKLoginViewController.m
//  Keybase
//
//  Created by App Requests on 3/14/14.
//  Copyright (c) 2014 Turboe Creations. All rights reserved.
//

#import "PGPKLoginViewController.h"
#import "PGPKGlobals.h"
#include <CommonCrypto/CommonHMAC.h>
#import "PGPKHex2Bin.h"

@interface PGPKLoginViewController ()

@end

@implementation PGPKLoginViewController
@synthesize loginField, passwordField, submitButton, responseData, manager, statusLabel;

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
    manager = [AFHTTPRequestOperationManager manager];
    statusLabel.text = @"Idle.";
}

- (IBAction)proccessLogin:(id)sender {
    statusLabel.text = @"Login button tapped.";
   [self loginRound1WithUsername:loginField.text];
}

- (void)loginRound1WithUsername:(NSString *)username {
    statusLabel.text = @"Begining stage 2";
    [manager GET:[NSString stringWithFormat:@"%@getsalt.json?email_or_username=%@", apiBaseURL, username] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        statusLabel.text = @"Login stage 1 complete.";
        [self loginRound2WithRound1Data:responseObject password:passwordField.text];
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        statusLabel.text = @"Login failed with error.";
        NSLog(@"Error: %@", error);
    }];
}

- (void)loginRound2WithRound1Data:(NSDictionary *)round1Data password:(NSString *)password {
    char *decoded = [PGPKHex2Bin decode:[round1Data objectForKey:@"salt"]];
    NSLog(@"%s AND %@", decoded, [round1Data objectForKey:@"salt"]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end