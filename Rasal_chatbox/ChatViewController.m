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
    
    [self.view.sendMessageBtn addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.sendMessageTxt addTarget:self action:@selector(animateScrollToViewTextField:) forControlEvents:UIControlEventEditingDidBegin];
    
}

- (void)animateScrollToViewTextField:(id)sender{
    NSLog(@"Did tapped Textfield");
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.view.sendMessageTxt.center = CGPointMake(self.view.frame.size.width / 2, 320);
                         self.view.sendMessageBtn.center = CGPointMake(self.view.frame.size.width - 36, self.view.sendMessageTxt.frame.origin.y + 20);
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
}

-(void)loadMessages{
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (Messages *message in self.messages) {
        
        if(message.compagnion_id == self.selectedUser.identifier){
            [array addObject:message];
        }
    }
    
    [self.view reloadChat:array];
}

- (void)sendMessage:(id)sender{
    self.messages = [NSMutableArray array];
    
    NSString *path = @"http://volpesalvatore.be/rasal/api/insertMessage";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"message": self.view.sendMessageTxt.text,
                             @"user_id": [NSString stringWithFormat:@"%d", 1],
                             @"compagnion_id": [NSString stringWithFormat:@"%d", self.selectedUser.identifier]};
    
    [manager POST:path
          parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) { NSLog(@"JSON: %@", responseObject); }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) { NSLog(@"Error: %@", error); }
     ];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reload_chat" object:self];
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
