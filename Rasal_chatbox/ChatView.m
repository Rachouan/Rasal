//
//  ChatView.m
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import "ChatView.h"

@implementation ChatView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        self.scrollVW = [[UIScrollView alloc]initWithFrame:frame];
        [self addSubview:self.scrollVW];
        
    }
    return self;
}

- (void)reloadChat:(NSMutableArray *)array{

    self.messages = array;
    
    NSLog(@"%@",self.messages);
    
    int yPos = 20;
    
    for (Messages *message in self.messages) {
        
        NSLog(@"%d, %d", message.compagnion_id, message.user_id);
        
        UILabel *user_message_lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 20, 30)];
        user_message_lbl.text = message.message;
        [user_message_lbl setBackgroundColor:[UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1]];
        user_message_lbl.center = CGPointMake(self.frame.size.width / 2, yPos);
        user_message_lbl.layer.cornerRadius = 10;
        [self.scrollVW addSubview:user_message_lbl];
        
        yPos += user_message_lbl.frame.size.height + 10;
    }
    
    self.scrollVW.contentSize = CGSizeMake(0, yPos);
    
    [self createSender];
}

- (void)createSender{
    
    self.sendMessageTxt = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 30, 40)];
    self.sendMessageTxt.layer.borderWidth = 1;
    self.sendMessageTxt.layer.borderColor = [UIColor colorWithRed:0.72 green:0.72 blue:0.72 alpha:1].CGColor;
    self.sendMessageTxt.layer.cornerRadius = 10;
    self.sendMessageTxt.center = CGPointMake((self.frame.size.width) / 2, (self.frame.size.height - self.sendMessageTxt.frame.size.height));
    [self addSubview:self.sendMessageTxt];
    
    self.sendMessageBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.sendMessageBtn setBackgroundColor:[UIColor colorWithRed:0.92 green:0.33 blue:0.31 alpha:1]];
    [self.sendMessageBtn setTitle:@"S" forState:UIControlStateNormal];
    [self.sendMessageBtn setTintColor:[UIColor whiteColor]];
    self.sendMessageBtn.frame = CGRectMake(0, 0, 30, 30);
    self.sendMessageBtn.center = CGPointMake(self.frame.size.width - 36, (self.sendMessageTxt.frame.origin.y) + 20);
    self.sendMessageBtn.layer.cornerRadius = 7;
    [self addSubview:self.sendMessageBtn];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
