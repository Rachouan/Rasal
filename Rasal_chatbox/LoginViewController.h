//
//  LoginViewController.h
//  Examen
//
//  Created by Rachouan Rejeb on 21/05/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "LoginView.h"
#import "User.h"
#import "UserFactory.h"
#import "RegisterViewController.h"

@interface LoginViewController : UIViewController
@property (nonatomic,strong) LoginView *view;
@property (nonatomic, strong) NSMutableArray * users;

@property (nonatomic, strong) User *current_user;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andUsers:(NSMutableArray *)array;

@end
