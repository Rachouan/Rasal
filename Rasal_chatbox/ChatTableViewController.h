//
//  ChatTableViewController.h
//  Rasal
//
//  Created by Rachouan Rejeb on 26/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "User.h"
#import "Messages.h"
#import "MessageFactory.h"
#import "ChatTableViewCell.h"

@interface ChatTableViewController : UITableViewController

@property (nonatomic, strong) User * selectedUser;
@property (nonatomic, strong) User * me;
@property (nonatomic, strong) NSMutableArray * messages;

- (id)initWithStyle:(UITableViewStyle)style andSelectedUser:(User*)selectedUser andMe:(User*)me;

@end
