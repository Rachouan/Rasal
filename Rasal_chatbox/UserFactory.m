//
//  UserFactory.m
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import "UserFactory.h"

@implementation UserFactory

+ (User*)createUserWithDictionary:(NSDictionary*)dictionary{
    
    User *user = [[User alloc] init];
    
    user.identifier = [[dictionary objectForKey:@"identifier"] integerValue];
    user.naam = [dictionary objectForKey:@"naam"];
    user.voornaam = [dictionary objectForKey:@"voornaam"];
    user.profilePic = [dictionary objectForKey:@"profilePic"];
    
    return user;
}

@end