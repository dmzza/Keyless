//
//  FirstViewController.h
//  Keyless
//
//  Created by David Mazza on 6/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface FirstViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *messageField;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) NSDictionary *cipher;
@property (strong, nonatomic) User *user;

@end
