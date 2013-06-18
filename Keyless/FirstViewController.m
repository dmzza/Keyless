//
//  FirstViewController.m
//  Keyless
//
//  Created by David Mazza on 6/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "FirstViewController.h"
#import "Password.h"
#import "User.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.messageField.delegate = self;
    self.cipher = [[NSDictionary alloc] initWithObjectsAndKeys:
                     @"vq", @"a",
                     @"Fj", @"b",
                     @"Ba", @"c",
                     @"sM", @"d",
                     @"Jf", @"e",
                     @"5v", @"f",
                     @"b8", @"g",
                     @"5D", @"h",
                     @"DQ", @"i",
                     @"aX", @"j",
                     @"FR", @"k",
                     @"BV", @"l",
                     @"Eq", @"m",
                     @"tR", @"n",
                     @"uG", @"o",
                     @"jZ", @"p",
                     @"Gg", @"q",
                     @"Wp", @"r",
                     @"7y", @"s",
                     @"85", @"t",
                     @"T6", @"u",
                     @"T3", @"v",
                     @"Mb", @"w",
                     @"sq", @"x",
                     @"B5", @"y",
                     @"nR", @"z",
                     @"R2", @"0",
                     @"j3", @"1",
                     @"N5", @"2",
                     @"3d", @"3",
                     @"A3", @"4",
                     @"J2", @"5",
                     @"65", @"6",
                     @"Ry", @"7",
                     @"Bz", @"8",
                     @"xu", @"9",
                     nil];
    [self.saveButton addTarget:self action:@selector(savePassword) forControlEvents:UIControlEventTouchDown];
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    [pb setString:[self encrypt:self.messageField.text]];
    NSURL *pastebotURL = [NSURL URLWithString:@"pastebot://"];
    [[UIApplication sharedApplication] openURL:pastebotURL];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (NSString *) encrypt:(NSString *)message {
    NSString *output = [[NSString alloc] init];

    if ([message length] > 0) {
        NSString *firstChar = [message substringToIndex:1];
        output = [NSString stringWithFormat:@"%@%@", [self.cipher objectForKey:firstChar], [self encrypt:[message substringFromIndex:1]]];
    } else {
        output = @"";
    }
    return output;
}

- (void)savePassword {
    Password *newSavedPassword = [[Password alloc] initWithName:@"Untitled" message:self.messageField.text customPassword:nil customUrl:nil];
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithArray:self.user.passwords];
    
    [tempArray addObject:newSavedPassword];
    self.user.passwords = [[NSArray alloc] initWithArray:tempArray];
    [User saveUser:self.user];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    if (!self.user) {
        self.user = [[User alloc] init];
    }
}

@end
