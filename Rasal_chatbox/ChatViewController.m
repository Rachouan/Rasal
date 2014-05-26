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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andChatVenster:(User*)selectedUser andMe:(User *)me andAllMessages:(NSMutableArray *)messages
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = [NSString stringWithFormat:@"%@", selectedUser.voornaam];
        
        self.selectedUser = selectedUser;
        self.me = me;
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:
                                    [self methodSignatureForSelector: @selector(timerCallback)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(timerCallback)];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 invocation:invocation repeats:NO];

        
        
        
    }
    return self;
}


- (void)loadAllMessages{
    
    self.newMessages = [NSMutableArray array];
    
    //NSLog(@"%lu",(unsigned long)self.messages.count);
    
    NSString *path = @"http://volpesalvatore.be/rasal/api/messages";
    
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error = nil;
        NSDictionary *loadedData = (NSDictionary *)responseObject;
        
        if(!error){
            for (NSDictionary *dict in loadedData) {
                Messages *message = [MessageFactory createMessageWithDictionarry:dict];
                
                if(message.compagnion_id == self.selectedUser.identifier){
                [self.messages addObject:message];
                }
            }
            
            [self.view reloadChat:self.messages];
        }else{
            NSLog(@"Error Json");
        }
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error Loading data");
    }];
    
    [operation start];
}


- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[ChatView alloc] initWithFrame:bounds andSelectedUser:self.selectedUser andMe:self.me];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadAllMessages];
    // Do any additional setup after loading the view.
    
    [self.view.sendMessageBtn addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.sendMessageTxt addTarget:self action:@selector(animateScrollToViewTextField:) forControlEvents:UIControlEventEditingDidBegin];
    
}

- (void)animateScrollToViewTextField:(id)sender{
    NSLog(@"Did tapped Textfield");
    
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.view.sendMessageTxt.center = CGPointMake(self.view.frame.size.width / 2, 320);
                         self.view.sendMessageBtn.center = CGPointMake(self.view.frame.size.width - 36, self.view.sendMessageTxt.frame.origin.y + 20);
                         
                         self.view.scrollVW.frame = CGRectMake(0, 0, bounds.size.width, 320);
                         
                         CGPoint bottomOffset = CGPointMake(0, self.view.scrollVW.contentSize.height - self.view.scrollVW.bounds.size.height);
                         [self.view.scrollVW setContentOffset:bottomOffset animated:NO];
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
}

- (void)animateScrollToViewTextFieldBack:(id)sender{
    NSLog(@"Did tapped Textfield");
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         
                         self.view.sendMessageTxt.enabled = NO;
                         self.view.sendMessageTxt.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height - self.view.sendMessageTxt.frame.size.height - 20);
                         self.view.sendMessageBtn.center = CGPointMake(self.view.sendMessageTxt.frame.origin.x + self.view.sendMessageTxt.frame.size.width - self.view.sendMessageBtn.frame.size.width/2 - 5, self.view.sendMessageTxt.frame.origin.y + 20);
                         
                         self.view.scrollVW.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height - 80);
                     }
                     completion:^(BOOL finished){
                         
                         self.view.sendMessageTxt.enabled = YES;
                         
                     }];
    
}

- (void)timerCallback {
    NSLog(@"reload");
	[self loadAllMessages];
}

- (void)sendMessage:(id)sender{
    self.messages = [NSMutableArray array];
    
    
    [self.view endEditing:YES];
    [self animateScrollToViewTextFieldBack:sender];
    
    
    if(![self.view.sendMessageTxt.text  isEqual:  @""]){
        
    NSString *path = @"http://volpesalvatore.be/rasal/api/insertMessage";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"message": self.view.sendMessageTxt.text,
                             @"user_id": [NSString stringWithFormat:@"%d", 1],
                             @"compagnion_id": [NSString stringWithFormat:@"%ldd",(long) (long)self.selectedUser.identifier]};
    
    [manager POST:path
          parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) { NSLog(@"JSON: %@", responseObject); }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) { NSLog(@"Error: %@", error); }
     ];
    
        self.view.sendMessageTxt.text = @"";
        [self loadAllMessages];
        
    }else{
        
        NSLog(@"Type something");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"WILL APPEAR");
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
