//
//  MessageFactory.m
//  Rasal
//
//  Created by Volpe Salvatore on 23/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import "MessageFactory.h"

@implementation MessageFactory

+ (Messages*)createMessageWithDictionarry:(NSDictionary*)dict{
    
    Messages *message = [[Messages alloc] init];
    
    message.identifier = [[dict objectForKey:@"id"] integerValue];
    message.current_date = [dict objectForKey:@"current_date"];
    
    message.message = [dict objectForKey:@"messages"];
    
    message.user_id = [[dict objectForKey:@"user_id"] integerValue];
    message.compagnion_id = [[dict objectForKey:@"compagnion_id"] integerValue];
    
    return message;
}

@end
