//
//  FirstViewController.m
//  Keyless
//
//  Created by David Mazza on 6/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.messageField.delegate = self;
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
    NSDictionary *cipher = [[NSDictionary alloc] initWithObjectsAndKeys:
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
    if ([message length] > 0) {
        NSString *firstChar = [message substringToIndex:1];
        output = [NSString stringWithFormat:@"%@%@", [cipher objectForKey:firstChar], [self encrypt:[message substringFromIndex:1]]];
    } else {
        output = @"";
    }
    return output;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
