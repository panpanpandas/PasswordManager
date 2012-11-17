//
//  PMPasswordSettingViewController.h
//  PasswordManager
//
//  Created by Pan Pan on 10/26/12.
//  Copyright (c) 2012 Pan Pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMSetting.h"

@interface PMPasswordSettingViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITextField *curPassword;
@property (strong, nonatomic) IBOutlet UITextField *nPassword;
@property (strong, nonatomic) IBOutlet UITextField *confirmedPassword;

@property (nonatomic, strong) PMSetting *setting;


- (IBAction)savePassword:(id)sender;


@end
