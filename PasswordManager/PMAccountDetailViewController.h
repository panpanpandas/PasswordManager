//
//  PMAccountDetailViewController.h
//  PasswordManager
//
//  Created by Pan Pan on 10/27/12.
//  Copyright (c) 2012 Pan Pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMAccount.h"

@interface PMAccountDetailViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITextField *aTitle;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (nonatomic, strong) PMAccount *account;

- (IBAction)saveAccount:(id)sender;


@end
