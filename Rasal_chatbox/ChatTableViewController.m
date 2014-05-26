//
//  ChatTableViewController.m
//  Rasal
//
//  Created by Rachouan Rejeb on 26/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import "ChatTableViewController.h"

@interface ChatTableViewController ()

@end

@implementation ChatTableViewController

- (id)initWithStyle:(UITableViewStyle)style andSelectedUser:(User*)selectedUser andMe:(User*)me
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.selectedUser = selectedUser;
        self.me = me;
    }
    return self;
}



- (void)loadAllMessages{
    
    self.messages = [NSMutableArray array];
    
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
            
            [self.tableView reloadData];
            
        }else{
            NSLog(@"Error Json");
        }
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error Loading data");
    }];
    
    [operation start];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadAllMessages];
    
    [self.tableView registerClass:[ChatTableViewCell class] forCellReuseIdentifier:@"userCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.messages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Messages *message = [self.messages objectAtIndex:indexPath.row];
    
    cell.textLabel.text = message.message;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
