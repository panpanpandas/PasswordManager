//
//  PMPasswordSettingViewController.m
//  PasswordManager
//
//  Created by Pan Pan on 10/26/12.
//  Copyright (c) 2012 Pan Pan. All rights reserved.
//

#import "PMPasswordSettingViewController.h"
#import "PMAppDelegate.h"

@interface PMPasswordSettingViewController ()

@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext;

@end

@implementation PMPasswordSettingViewController

@synthesize setting = _setting;


- (void)viewDidLoad
{
    [super viewDidLoad];

    NSFetchRequest *fetchRequst = [NSFetchRequest fetchRequestWithEntityName:@"PMSetting"];
    NSArray *r = [self.managedObjectContext executeFetchRequest:fetchRequst error:nil];
    if ([r count] == 0) {
        self.setting = [NSEntityDescription insertNewObjectForEntityForName:@"PMSetting" inManagedObjectContext:self.managedObjectContext];
        self.setting.password = @"";
        [self.managedObjectContext save:nil];
    } else {
        self.setting =[r objectAtIndex:0];
    }
    

    // hide keyboard when touch outside
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gestureRecognizer.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:gestureRecognizer];
}


- (NSManagedObjectContext *) managedObjectContext
{
    return [(PMAppDelegate *) [[UIApplication sharedApplication] delegate] managedObjectContext];
}


- (void) hideKeyboard {
    [_curPassword resignFirstResponder];
    [_nPassword resignFirstResponder];
    [_confirmedPassword resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showAlert:(NSString *) msg {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)savePassword:(id)sender {
    if (![_curPassword.text isEqualToString:self.setting.password]) {
        [self showAlert:@"Current password doesn't match"];
    } else if (![_nPassword.text isEqualToString:_confirmedPassword.text]) {
        [self showAlert:@"Confirmed passwrod doesn't match"];
    } else {
        self.setting.password = _nPassword.text;
        [self.managedObjectContext save:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}


@end
