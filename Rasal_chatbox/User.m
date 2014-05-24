//
//  User.m
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import "User.h"

@implementation User

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.email forKey:@"current_email"];
    [encoder encodeObject:self.naam forKey:@"current_naam"];
    [encoder encodeObject:self.voornaam forKey:@"current_voornaam"];
    [encoder encodeObject:self.profilePic forKey:@"current_profilePic"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    if ((self = [super init])) {
        self.email = [decoder decodeObjectForKey:@"current_email"];
        self.naam = [decoder decodeObjectForKey:@"current_naam"];
        self.voornaam = [decoder decodeObjectForKey:@"current_voornaam"];
        self.profilePic = [decoder decodeObjectForKey:@"current_profilePic"];
    };
    
    return self;
}

@end
