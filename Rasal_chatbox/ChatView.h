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

@interface ChatView : UIView

@property (nonatomic,strong) NSMutableArray *messages;
@property (nonatomic, strong) UIScrollView * scrollVW;

@property (nonatomic, strong) UITextField *sendMessageTxt;
@property (nonatomic, strong) UIButton *sendMessageBtn;
@property (nonatomic, strong) CAShapeLayer * rectangle;

-(void)reloadChat:(NSMutableArray *)array;

@end
