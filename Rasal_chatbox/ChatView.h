//
//  ChatView.h
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Messages.h"
#import "User.h"

@interface ChatView : UIView

@property (nonatomic,strong) NSMutableArray *messages;
@property (nonatomic, strong) UIScrollView * scrollVW;

@property (nonatomic, strong) UITextField *sendMessageTxt;
@property (nonatomic, strong) UIButton *sendMessageBtn;
@property (nonatomic, strong) CAShapeLayer * rectangle;
@property (nonatomic, strong) User * selectedUser;
@property (nonatomic, strong) User * me;

-(void)reloadChat:(NSMutableArray *)array;

- (id)initWithFrame:(CGRect)frame andSelectedUser:(User*)selected_user andMe:(User*)me;

@end
