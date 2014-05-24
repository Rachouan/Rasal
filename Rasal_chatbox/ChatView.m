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

-(void)reloadChat:(NSMutableArray *)array{
    
    self.messages = array;
    
    NSLog(@"%@",self.messages);
    
    int yPos = 20;
    
    for (Messages *message in self.messages) {
        
        self.user_message_lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, yPos, self.frame.size.width, 30)];
        self.user_message_lbl.text = message.message;
        [self.user_message_lbl setBackgroundColor:[UIColor redColor]];
        [self.scrollVW addSubview:self.user_message_lbl];
        
        yPos += self.user_message_lbl.frame.size.height + 40;

    }
    
    
    self.scrollVW.contentSize = CGSizeMake(0, 600);
    
    if(yPos > self.frame.size.height){
        
        self.scrollVW.contentSize = CGSizeMake(0, yPos);
    }
    
    
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
