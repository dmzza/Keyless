//
//  FirstViewController.h
//  Keyless
//
//  Created by David Mazza on 6/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface PasswordTableViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) UITextField *messageField;
@property (strong, nonatomic) UIButton *saveButton;
@property (strong, nonatomic) UIBarButtonItem *lockButton;
@property (strong, nonatomic) UIBarButtonItem *editButton;
@property (strong, nonatomic) NSDictionary *cipher;
@property (strong, nonatomic) User *user;

@end
