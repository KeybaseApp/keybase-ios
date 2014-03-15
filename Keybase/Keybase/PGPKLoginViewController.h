//
//  PGPKLoginViewController.h
//  Keybase
//
//  Created by App Requests on 3/14/14.
//  Copyright (c) 2014 Turboe Creations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface PGPKLoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *loginField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) NSDictionary *responseData;
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@end
