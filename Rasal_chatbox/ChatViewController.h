//
//  ChatViewController.h
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "ChatView.h"
#import "User.h"
#import "Messages.h"
#import "MessageFactory.h"

@interface ChatViewController : UIViewController

@property (nonatomic, strong) ChatView *view;
@property (nonatomic,strong)NSMutableArray *messages;
@property (nonatomic, strong) User * selectedUser;
@property (nonatomic, strong) User * me;
@property (nonatomic, strong) NSTimer * timer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andChatVenster:(User*)selectedUser andMe:(User*)me andAllMessages:(NSMutableArray *)messages;
- (void)viewWillAppear:(BOOL)animated;


@end
