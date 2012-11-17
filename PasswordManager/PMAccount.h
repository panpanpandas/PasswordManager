//
//  PMAccount.h
//  PasswordManager
//
//  Created by Pan Pan on 11/16/12.
//  Copyright (c) 2012 Pan Pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PMAccount : NSManagedObject

@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * image;

@end
