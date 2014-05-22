//
//  ChatViewController.h
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatView.h"
#import "User.h"

@interface ChatViewController : UIViewController

@property (nonatomic, strong) ChatView *view;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andChatVenster:(User*)selectedUser;

@end
