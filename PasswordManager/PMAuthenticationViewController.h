//
//  PMAuthenticationViewController.h
//  PasswordManager
//
//  Created by Pan Pan on 11/16/12.
//  Copyright (c) 2012 Pan Pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMSetting.h"

@interface PMAuthenticationViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) UITabBarController *tabController;
@property (strong, nonatomic) PMSetting *setting;

- (IBAction)unlockBtn:(id)sender;

@end
