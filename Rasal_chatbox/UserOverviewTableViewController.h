//
//  UserOverviewTableViewController.h
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "User.h"
#import "UserFactory.h"
#import "ChatViewController.h"
#import "UserOverviewTableViewCell.h"
#import <AFNetworking.h>

@interface UserOverviewTableViewController : UITableViewController <UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *users;
@property (nonatomic,strong)UIRefreshControl * refreshControl;
@property (nonatomic, strong) NSMutableArray * loadedData;
@property (nonatomic, strong) NSMutableArray *messages;

@end
