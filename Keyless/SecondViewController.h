//
//  SecondViewController.h
//  Keyless
//
//  Created by David Mazza on 6/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;
@class Password;

@interface SecondViewController : UIViewController

@property (strong, nonatomic) User *user;
@property (strong, nonatomic) IBOutlet UIButton *savedPassword1;

@end
