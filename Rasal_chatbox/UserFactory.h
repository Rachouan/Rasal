//
//  UserFactory.h
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserFactory : NSObject

+ (User*)createUserWithDictionary:(NSDictionary*)dictionary;

@end
