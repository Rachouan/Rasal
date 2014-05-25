//
//  ChatView.m
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import "ChatView.h"

@implementation ChatView

- (id)initWithFrame:(CGRect)frame andSelectedUser:(User*)selected_user andMe:(User*)me
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
    
    for (UIView *subview in self.scrollVW.subviews) {
        [subview removeFromSuperview];
    }
    
    UIImage *image = [UIImage imageNamed:@"1.png"];
    
    int yPos = 40;
    
    UIImage *clock = [UIImage imageNamed:@"watch"];
    
    for (Messages *message in self.messages) {
        
        
        int xPos = 20;
        
        UILabel *user_message_lbl = [[UILabel alloc]init];
        user_message_lbl.frame = CGRectMake(xPos+100, yPos, 150, 100);
                                     
    
        if(message.user_id != self.selectedUser.identifier){
            
            xPos = self.frame.size.width;
            user_message_lbl.frame = CGRectMake(xPos-100 - 150, yPos, 150, 100);

            
        }
        
        CALayer * imageLayer = [CALayer layer];
        imageLayer.frame = CGRectMake(xPos, yPos-20, 100, 100);
        [imageLayer setContents:(id)[image CGImage]];
        
        [self.scrollVW.layer addSublayer:imageLayer];
        
        CAShapeLayer *mask = [CAShapeLayer layer];
        mask.fillColor = [UIColor whiteColor].CGColor;
        mask.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(xPos, 0, 70, 70)].CGPath;
        mask.position = CGPointMake(imageLayer.bounds.origin.x + (imageLayer.frame.size.width)/2, imageLayer.bounds.origin.y + (imageLayer.frame.size.height)/2);
        mask.bounds = CGRectMake(xPos, 0, 50, 50);
        
        
        [self.scrollVW.layer addSublayer:mask];
        
        
        imageLayer.mask = mask;
        
        
        //user_message_lbl.layer.borderColor = [UIColor colorWithRed:221.0f/255.0f green:222.0f/255.0f blue:219.0f/255.0f alpha:1.0f].CGColor;
        
        [self drawRect:CGRectMake(0, 0, 100, 100)];
        
        
        user_message_lbl.text = message.message;
        user_message_lbl.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
        user_message_lbl.textColor = [UIColor colorWithRed:17.0f/255.0f green:46.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
        user_message_lbl.layer.borderWidth = 1.0;
        user_message_lbl.layer.cornerRadius = 10;
        user_message_lbl.lineBreakMode = UILineBreakModeCharacterWrap;
        user_message_lbl.numberOfLines = 0;
        
        
        
        
        
        CGSize constrainedSize = CGSizeMake(user_message_lbl.frame.size.width  , 9999);
        
        NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                              [UIFont fontWithName:@"Avenir-Medium" size:14.0], NSFontAttributeName,
                                              nil];
        
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"textToShow" attributes:attributesDictionary];
        
        CGRect requiredHeight = [string boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        
        if (requiredHeight.size.width > user_message_lbl.frame.size.width) {
            requiredHeight = CGRectMake(0,0, user_message_lbl.frame.size.width, requiredHeight.size.height);
        }
        CGRect newFrame = user_message_lbl.frame;
        newFrame.size.height = requiredHeight.size.height;
        user_message_lbl.frame = newFrame;
        
        
        
        
        
        
        
        [self.scrollVW addSubview:user_message_lbl];

        
        
        /*NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"EE, d LLLL yyyy HH:mm:ss Z"];
        NSDate *date = [dateFormat dateFromString:message.current_date];*/
        
        NSLog(@"%@",message.current_date);
        
        UIImageView *image = [[UIImageView alloc]initWithImage:clock];
        image.center = CGPointMake(user_message_lbl.frame.origin.x + 20, user_message_lbl.frame.origin.y + user_message_lbl.frame.size.height - image.frame.size.height - 10);
        [self.scrollVW addSubview:image];
        
        
        UILabel *hour = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
        hour.text = @"12:00pm";
        hour.font = [UIFont fontWithName:@"Avenir-Medium" size:12];
        hour.textColor = [UIColor colorWithRed:234.0f/255.0f green:73.0f/255.0f blue:85.0f/255.0f alpha:1.0f];
        hour.center = CGPointMake(image.frame.origin.x + image.frame.size.width + 30 , image.frame.origin.y + 5);
        hour.numberOfLines = 0;
        [self.scrollVW addSubview:hour];
        
        yPos += user_message_lbl.frame.size.height + 20;
        
        
        
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
