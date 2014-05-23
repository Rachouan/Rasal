//
//  MessageFactory.h
//  Rasal
//
//  Created by Volpe Salvatore on 23/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Messages.h"

@interface MessageFactory : NSObject

+ (Messages*)createMessageWithDictionarry:(NSDictionary*)dict;

@end
