//
//  SecondViewController.m
//  Keyless
//
//  Created by David Mazza on 6/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "SecondViewController.h"
#import "User.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!self.user) {
        self.user = [User getUser];
    }
	if (self.user && [self.user.passwords count] > 0) {
        [self.savedPassword1 setTitle:[self.user.passwords[0] message] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
//    if (!self.user) {
//        self.user = [User getUser];
//    }
}

@end
