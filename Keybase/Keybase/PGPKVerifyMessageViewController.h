//
//  PGPKVerifyMessageViewController.h
//  Keybase
//
//  Created by App Requests on 3/13/14.
//  Copyright (c) 2014 Turboe Creations. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGPKVerifyMessageViewController : UIViewController <UITextViewDelegate> {
    IBOutlet UITextView *messageToVerify;
}
@property (strong, nonatomic) UITextView *messageToVerify;

@end
