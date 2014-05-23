//
//  Messages.h
//  Rasal
//
//  Created by Volpe Salvatore on 23/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Messages : NSObject

@property (nonatomic) NSInteger identifier;
@property (nonatomic, strong) NSDate *current_date;
@property (nonatomic, strong) NSString *message;

@property (nonatomic) NSInteger user_id;
@property (nonatomic) NSInteger compagnion_id;

@end
