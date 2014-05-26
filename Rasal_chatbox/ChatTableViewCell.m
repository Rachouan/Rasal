//
//  ChatTableViewCell.m
//  Rasal
//
//  Created by Rachouan Rejeb on 26/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import "ChatTableViewCell.h"

@implementation ChatTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (!self.bubbleImage)
        {
            self.bubbleImage = [[UIImageView alloc] init];
            [self addSubview:self.bubbleImage];
        }
        
        
        
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        
        CGFloat x = (self.message.user_id == self.selectedUser.identifier) ? 0 : self.frame.size.width - width - 20 - 20;
        CGFloat y = 0;
        
        // Adjusting the x coordinate for avatar
        if (self.showAvatar)
        {
            [self.avatarImage removeFromSuperview];
            /*self.avatarImage = [[UIImageView alloc] initWithImage:(self.selectedUser.profilePic ? self.me.profilePic : [UIImage imageNamed:@"missingAvatar.png"])];
            self.avatarImage.layer.cornerRadius = 9.0;
            self.avatarImage.layer.masksToBounds = YES;
            self.avatarImage.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.2].CGColor;
            self.avatarImage.layer.borderWidth = 1.0;*/
            
            /*CGFloat avatarX = (type == BubbleTypeSomeoneElse) ? 2 : self.frame.size.width - 52;
            CGFloat avatarY = self.frame.size.height - 50;*/
            
            /*self.avatarImage.frame = CGRectMake(avatarX, avatarY, 50, 50);
            [self addSubview:self.avatarImage];
            
            CGFloat delta = self.frame.size.height - (self.data.insets.top + self.data.insets.bottom + self.data.view.frame.size.height);
            if (delta > 0) y = delta;
            
            if (type == BubbleTypeSomeoneElse) x += 54;
            if (type == BubbleTypeMine) x -= 54;*/
        }
        
        /*[self.customView removeFromSuperview];
        self.customView = [UIView alloc];
        self.customView.frame = CGRectMake(x + 20, y + 20, width, height);
        [self.contentView addSubview:self.customView];
        
        if (self.message.user_id == self.selectedUser.identifier)
        {
            self.bubbleImage.image = [[UIImage imageNamed:@"bubbleSomeone.png"] stretchableImageWithLeftCapWidth:21 topCapHeight:14];
            
        }
        else {
            self.bubbleImage.image = [[UIImage imageNamed:@"bubbleMine.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:14];
        }
        
        self.bubbleImage.frame = CGRectMake(x, y, width + 20 + 20, height + 20 + 20);*/
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
