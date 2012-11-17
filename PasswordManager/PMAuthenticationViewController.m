//
//  PMAuthenticationViewController.m
//  PasswordManager
//
//  Created by Pan Pan on 11/16/12.
//  Copyright (c) 2012 Pan Pan. All rights reserved.
//

#import "PMAuthenticationViewController.h"
#import "PMAppDelegate.h"

@interface PMAuthenticationViewController ()

@end

@implementation PMAuthenticationViewController

@synthesize tabController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSManagedObjectContext *) managedObjectContext
{
    return [(PMAppDelegate *) [[UIApplication sharedApplication] delegate] managedObjectContext];
}

- (void) showAlert:(NSString *) msg {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabbar"];
    
    NSFetchRequest *fetchRequst = [NSFetchRequest fetchRequestWithEntityName:@"PMSetting"];
    NSArray *r = [self.managedObjectContext executeFetchRequest:fetchRequst error:nil];
    if ([r count] == 0) {
        [[self navigationController] presentViewController:tabController animated:YES completion:nil];
        return;
    } else {
        self.setting =[r objectAtIndex:0];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unlockBtn:(id)sender {
    if([self.setting.password isEqualToString:self.password.text]) {
        [[self navigationController] presentViewController:tabController animated:YES completion:nil];
        return;
    } else {
        [self showAlert:@"Password Error"];
    }
}
@end
