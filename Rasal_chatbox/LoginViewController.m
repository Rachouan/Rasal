//
//  LoginViewController.m
//  Examen
//
//  Created by Rachouan Rejeb on 21/05/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andUsers:(NSMutableArray *)array
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.users = array;
        
        NSLog(@"%@",self.users);
    }
    return self;
}
-(void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[LoginView alloc]initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view.btnLogin addTarget:self action:@selector(loginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnRegister addTarget:self action:@selector(registerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)loginButtonTapped:(id)sender{
    
    NSString *loginPath = [NSString stringWithFormat:@"http://volpesalvatore.be/rasal/api/login/%@/%@", self.view.txtUsername.text, self.view.txtPassword.text];
    NSURL *url = [NSURL URLWithString:loginPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.view endEditing:YES];
    
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error = nil;
        NSDictionary *loadedData = (NSDictionary *)responseObject;
        
        BOOL loadedDataEmpty = ([loadedData count] != 0);
        
        if(!error){
            if (loadedDataEmpty) {
                [self.view endEditing:YES];
                [self performSelector:@selector(login) withObject:self afterDelay:1.0 ];
    
                self.current_user = [UserFactory createUserWithDictionary:loadedData];
                
                NSLog(@"%@", [self currentUserArchivePath]);
                
                if([self save]){
                    NSLog(@"[LOGIN] Data object saved at %@", [self currentUserArchivePath]);
                }else{
                    NSLog(@"Data not saved");
                }
                
            }else{
                [self.view errorLogin];
                [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"current_user"];
            }
        }else{
            NSLog(@"Error Json");
        }
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error Loading data");
        [self.view errorLogin];
    }];
    
    [operation start];
}

- (NSString*)currentUserArchivePath{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:@"current_user.archive"];
}

- (BOOL)save{
    NSString *path = [self currentUserArchivePath];
    return [NSKeyedArchiver archiveRootObject:self.current_user toFile:path];
}

- (void)registerButtonTapped:(id)sender{
    RegisterViewController *registerVC = [[RegisterViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:registerVC];
    
    [self presentViewController:navigationController animated:YES completion:^{}];
}

-(void)login{
    
    [self.view.btnLogin setImage:[UIImage imageNamed:@"unlock"] forState:UIControlStateNormal];
    [self performSelector:@selector(dismiss) withObject:self afterDelay:1.0 ];
    
}
-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{}];
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
