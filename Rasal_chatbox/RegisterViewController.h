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


@interface RegisterViewController : UIViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) User *current_user;
@property (nonatomic, strong) RegisterView *view;

@property (nonatomic, strong) NSMutableArray *notEmptyTextfieldsArray;

@property (nonatomic, strong) UIImagePickerController *cameraImagePC;

@property (nonatomic, strong) UIImage *current_user_image;
@property (nonatomic, strong) NSData *current_user_image_data;

@end
