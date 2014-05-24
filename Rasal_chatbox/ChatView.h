//
//  ChatView.h
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Messages.h"

@interface ChatView : UIView

@property (nonatomic, strong) UILabel *user_message_lbl;
@property (nonatomic, strong) UILabel *compagnion_message_lbl;
@property (nonatomic,strong) NSMutableArray *messages;
@property (nonatomic, strong) UIScrollView * scrollVW;

-(void)reloadChat:(NSMutableArray *)array;

@end
