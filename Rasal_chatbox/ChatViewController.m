//
//  ChatViewController.m
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andChatVenster:(User*)selectedUser andAllMessages:(NSMutableArray *)messages
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = [NSString stringWithFormat:@"%@", selectedUser.voornaam];
        
        self.selectedUser = selectedUser;
        self.messages = messages;
        
    }
    return self;
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[ChatView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadMessages];
    // Do any additional setup after loading the view.
}
-(void)loadMessages{
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (Messages *message in self.messages) {
        
        NSLog(@"Sending message %@",message.message);
        
        if(message.user_id == self.selectedUser.identifier){
            
            [array addObject:message];
            
        }
        
    }
    [self.view reloadChat:array];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
