//
//  PGPKVerifyMessageViewController.m
//  Keybase
//
//  Created by App Requests on 3/13/14.
//  Copyright (c) 2014 Turboe Creations. All rights reserved.
//

#import "PGPKVerifyMessageViewController.h"

@interface PGPKVerifyMessageViewController ()

@end

@implementation PGPKVerifyMessageViewController
@synthesize messageToVerify;

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
    messageToVerify.text = [UIPasteboard generalPasteboard].string;
}

-(void)viewDidAppear:(BOOL)animated
{
    messageToVerify.text = [UIPasteboard generalPasteboard].string;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textViewDidBeginEditing:(UITextView *)textView {
    textView.text = @"";
}

@end
