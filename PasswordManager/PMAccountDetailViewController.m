//
//  PMAccountDetailViewController.m
//  PasswordManager
//
//  Created by Pan Pan on 10/27/12.
//  Copyright (c) 2012 Pan Pan. All rights reserved.
//

#import "PMAccountDetailViewController.h"
#import "PMAppDelegate.h"

@interface PMAccountDetailViewController ()

@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext;

@end


@implementation PMAccountDetailViewController

@synthesize account = _account;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.aTitle.text = self.account.title;
    self.username.text = self.account.username;
    self.password.text = self.account.password;
    
    // hide keyboard when touch outside
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gestureRecognizer.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:gestureRecognizer];
}

- (void) hideKeyboard {
    [_aTitle resignFirstResponder];
    [_username resignFirstResponder];
    [_password resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSManagedObjectContext *) managedObjectContext
{
    return [(PMAppDelegate *) [[UIApplication sharedApplication] delegate] managedObjectContext];
}

- (IBAction)saveAccount:(id)sender {
    self.account.password = self.password.text;
    self.account.username = self.username.text;
    self.account.title = self.aTitle.text;
    
    [self.managedObjectContext save:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
