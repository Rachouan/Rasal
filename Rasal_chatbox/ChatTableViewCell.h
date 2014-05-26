//
//  ChatTableViewCell.h
//  Rasal
//
//  Created by Rachouan Rejeb on 26/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Messages.h"

@interface ChatTableViewCell : UITableViewCell

@property (nonatomic) BOOL  showAvatar;

@property (nonatomic, retain) UIView *customView;
@property (nonatomic, retain) UIImageView *bubbleImage;
@property (nonatomic, retain) UIImageView *avatarImage;
@property (nonatomic, strong) User * selectedUser;
@property (nonatomic, strong) User * me;
@property (nonatomic, strong) Messages * message;

@end
