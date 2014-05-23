//
//  User.h
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *naam;
@property (nonatomic, strong) NSString *voornaam;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *profilePic;
@property (nonatomic, strong) NSDate *creation_date;
@property (nonatomic) Boolean active;

@property (nonatomic) NSInteger identifier;

@end
