//
//  RegisterViewController.h
//  Rasal
//
//  Created by Volpe Salvatore on 24/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "RegisterView.h"
#import "User.h"
#import "UserFactory.h"
//#import "UserOverviewTableViewController.h"


@interface RegisterViewController : UIViewController

@property (nonatomic, strong) User *current_user;
@property (nonatomic, strong) RegisterView *view;

@property (nonatomic, strong) NSMutableArray *notEmptyTextfieldsArray;

@end
