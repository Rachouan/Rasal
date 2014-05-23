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
    
    user.identifier = [[dictionary objectForKey:@"id"] integerValue];
    user.naam = [dictionary objectForKey:@"naam"];
    user.email = [dictionary objectForKey:@"email"];
    user.password = [dictionary objectForKey:@"password"];
    user.voornaam = [dictionary objectForKey:@"voornaam"];
    user.creation_date = [dictionary objectForKey:@"date"];
    user.profilePic = [dictionary objectForKey:@"profilePic"];
    user.active = [[dictionary objectForKey:@"active"] boolValue];
    
    return user;
}

@end
