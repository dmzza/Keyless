//
//  FirstViewController.m
//  Keyless
//
//  Created by David Mazza on 6/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "PasswordTableViewController.h"
#import "Password.h"
#import "User.h"

@interface PasswordTableViewController ()

@end

@implementation PasswordTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if(self) {
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
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.messageField = [[UITextField alloc] init];
    self.messageField.frame = CGRectMake(15,27,255,30);
    self.messageField.borderStyle = UITextBorderStyleRoundedRect;
    self.messageField.keyboardType = UIKeyboardTypeDefault;
    self.messageField.delegate = self;
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.saveButton.frame = CGRectMake(270, 20, 44, 44);
    
    
    [self.saveButton addTarget:self action:@selector(savePassword) forControlEvents:UIControlEventTouchDown];
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    [pb setString:[self encrypt:self.messageField.text]];
    NSURL *pastebotURL = [NSURL URLWithString:@"pastebot://"];
    [[UIApplication sharedApplication] openURL:pastebotURL];
    self.messageField.text = @"";
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
    NSLog(@"saved");
    
    
    [tempArray addObject:newSavedPassword];
    self.user.passwords = [[NSArray alloc] initWithArray:tempArray];
    [User saveUser:self.user];
    
    [[self tableView] setEditing:YES animated:YES];
    self.messageField.text = @"";
    
    [[self tableView] reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return self.user.passwords.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *newPasswordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0, 60.0)];
    newPasswordView.backgroundColor = [UIColor whiteColor];
    
    [newPasswordView addSubview:self.messageField];
    [newPasswordView addSubview:self.saveButton];
    
    return newPasswordView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	
	if(cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
	}
	
    cell.textLabel.text = [self.user.passwords[indexPath.row] name];
    cell.detailTextLabel.text = [self.user.passwords[indexPath.row] message];
    cell.showsReorderControl = YES;
    
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    [pb setString:[self encrypt:[self.user.passwords[indexPath.row] message]]];
    NSURL *pastebotURL = [NSURL URLWithString:@"pastebot://"];
    [[UIApplication sharedApplication] openURL:pastebotURL];
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    Password *movingPassword = self.user.passwords[sourceIndexPath.row];
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.user.passwords];
    [tempArray removeObjectAtIndex:sourceIndexPath.row];
    [tempArray insertObject:movingPassword atIndex:destinationIndexPath.row];
    self.user.passwords = [[NSArray alloc] initWithArray:tempArray];
    [User saveUser:self.user];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.user.passwords];
        [tempArray removeObjectAtIndex:indexPath.row];
        self.user.passwords = [NSArray arrayWithArray:tempArray];
        [User saveUser:self.user];
        [[self tableView] deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.user = [User getUser];
    if (!self.user) {
        self.user = [[User alloc] init];
    }
}

@end
