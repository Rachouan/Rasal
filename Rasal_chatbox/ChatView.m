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
        
        self.scrollVW = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 80)];
        [self addSubview:self.scrollVW];
        
        [self createSender];
        
    }
    return self;
}

- (void)reloadChat:(NSMutableArray *)array{

    self.messages = array;
    
    NSLog(@"%@",self.messages);
    
    int yPos = 20;
    
    for (Messages *message in self.messages) {
        
        UILabel *user_message_lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 360, 30)];
        user_message_lbl.text = message.message;
        [user_message_lbl setBackgroundColor:[UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1]];
        user_message_lbl.center = CGPointMake(self.frame.size.width / 2, yPos);
        user_message_lbl.layer.cornerRadius = 10;
        user_message_lbl.numberOfLines = 0;
        [self.scrollVW addSubview:user_message_lbl];
        
        yPos += user_message_lbl.frame.size.height + 10;
    }
    
    self.scrollVW.contentSize = CGSizeMake(0, yPos);
    
    
    CGPoint bottomOffset = CGPointMake(0, self.scrollVW.contentSize.height - self.scrollVW.bounds.size.height);
    [self.scrollVW setContentOffset:bottomOffset animated:NO];
    
    
}



- (void)createSender{
    
    self.sendMessageTxt = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 30, 40)];
    self.sendMessageTxt.layer.borderWidth = 1;
    self.sendMessageTxt.layer.borderColor = [UIColor colorWithRed:0.72 green:0.72 blue:0.72 alpha:1].CGColor;
    self.sendMessageTxt.layer.cornerRadius = 10;
    self.sendMessageTxt.backgroundColor = [UIColor whiteColor];
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
