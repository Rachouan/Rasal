//
//  UserOverviewTableViewController.m
//  Rasal_chatbox
//
//  Created by Volpe Salvatore on 21/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import "UserOverviewTableViewController.h"

@interface UserOverviewTableViewController ()

@end

@implementation UserOverviewTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"Users";
        self.users = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:path];
        NSError *error = nil;
        
        NSArray *loadedData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        
        if(!error){
            NSLog(@"%@", loadedData);
        }else{
            NSLog(@"Error Json");
        }
        
        for (NSDictionary *dict in loadedData) {
            User *user = [UserFactory createUserWithDictionary:dict];
            [self.users addObject:user];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    
     UIEdgeInsets inset = UIEdgeInsetsMake(70, 0, 0, 0);
     self.tableView.contentInset = inset;
     [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 120, 0, 20)];
    
    [self.tableView registerClass:[UserOverviewTableViewCell class] forCellReuseIdentifier:@"userCell"];
    [self.tableView setSeparatorColor:[UIColor colorWithRed:0.94 green:0.98 blue:0.45 alpha:1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.users.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    NSString static *identifier = @"userCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    // Configure the cell...
    User *user = [self.users objectAtIndex:indexPath.row];
    
    NSLog(@"hier komt die");
    
    cell.contentScaleFactor = 30;
    cell.textLabel.text = user.voornaam;
    cell.textLabel.font = [UIFont fontWithName:@"AvenirNext-MediumItalic" size:20];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.textLabel.textColor = [UIColor colorWithRed:0.94 green:0.98 blue:0.45 alpha:1];
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.cornerRadius = 40;
    cell.imageView.layer.position = CGPointMake(500, 300);
    cell.imageView.layer.borderWidth = 5;
    cell.imageView.layer.borderColor = [UIColor colorWithHue:0.18 saturation:0.54 brightness:0.98 alpha:1].CGColor;
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"message_icon"]];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", user.profilePic]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    User *selectedUser = [self.users objectAtIndex:indexPath.row];
    
    ChatViewController *chatVC = [[ChatViewController alloc] initWithNibName:nil bundle:nil andChatVenster:selectedUser];
    [self.navigationController pushViewController:chatVC animated:YES];
    
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
