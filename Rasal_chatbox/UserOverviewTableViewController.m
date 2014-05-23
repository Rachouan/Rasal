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
        self.title = @"Rasal";
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
        
        
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:234.0f/255.0f green:73.0f/255.0f blue:85.0f/255.0f alpha:1.0f]];
        
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView setSeparatorColor:[UIColor colorWithRed:221.0f/255.0f green:222.0f/255.0f blue:219.0f/255.0f alpha:1.0f]];
    return 100.0f;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    
     UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 0, 0);
     self.tableView.contentInset = inset;
     [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 120, 0, 20)];
    
    [self.tableView registerClass:[UserOverviewTableViewCell class] forCellReuseIdentifier:@"userCell"];
    //[self.tableView setSeparatorColor:[UIColor colorWithRed:0.94 green:0.98 blue:0.45 alpha:1]];
}
- (void)refreshTable {
    //TODO: refresh your data
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
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
    
    /*cell.contentScaleFactor = 30;
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
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", user.profilePic]];*/
    
    //create your own labels and image view object, specify the frame
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    [cell.contentView.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", user.profilePic]];
    
    UIView *customColorView = [[UIView alloc] init];
    customColorView.backgroundColor = [UIColor colorWithRed:239/255.0
                                                      green:235/255.0
                                                       blue:236/255.0
                                                      alpha:0.5];
    cell.selectedBackgroundView =  customColorView;
    

    UIImageView *photo = [[UIImageView alloc] initWithFrame:CGRectMake(225.0, 0.0, image.size.width, image.size.height)];
    photo.image = image;
    
    
    CALayer * imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(0, 0, 100, 100);
    imageLayer.contents = (__bridge id)(photo.image.CGImage);
    
    [cell.contentView.layer addSublayer:imageLayer];
    
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.fillColor = [UIColor whiteColor].CGColor;
    mask.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 70, 70)].CGPath;
    mask.position = CGPointMake(imageLayer.bounds.origin.x + (imageLayer.frame.size.width)/2, imageLayer.bounds.origin.y + (imageLayer.frame.size.height)/2);
    mask.bounds = CGRectMake(0, 0, 70, 70);
    
    
    [cell.contentView.layer addSublayer:mask];
    
    
    UILabel *mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(mask.bounds.origin.x + mask.bounds.size.width + 40, (cell.frame.size.height/2 - 15), 220.0, 15.0)];
    mainLabel.font = [UIFont fontWithName:@"Bariol-Regular" size:20];
    mainLabel.textColor = [UIColor colorWithRed:17.0f/255.0f green:46.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
    [cell.contentView addSubview:mainLabel];
    
    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(mask.bounds.origin.x + mask.bounds.size.width + 40, (cell.frame.size.height/2 + 5), 220.0, 20)];
    secondLabel.font = [UIFont fontWithName:@"Bariol-Regular" size:10];
    secondLabel.textColor = [UIColor colorWithRed:234.0f/255.0f green:73.0f/255.0f blue:85.0f/255.0f alpha:1.0f];
    [cell.contentView addSubview:secondLabel];
    
    imageLayer.mask = mask;
    
    UIImage *featherImg = [UIImage imageNamed:@"feather"];

    
    UIImageView *feather = [[UIImageView alloc] initWithFrame:CGRectMake(cell.frame.size.width - featherImg.size.width - 20, (cell.frame.size.height - featherImg.size.height)/2, featherImg.size.width, featherImg.size.height)];
    feather.image = featherImg;
    
    [cell.contentView addSubview:feather];
    
    
    //assign content
    mainLabel.text = [NSString stringWithFormat:@"%@ %@",user.voornaam,user.naam];
    secondLabel.text = @"Hey hoe gaat ...";
    
    return cell;
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
