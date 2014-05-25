//
//  RegisterViewController.m
//  Rasal
//
//  Created by Volpe Salvatore on 24/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
        
        UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelBtnTapped:)];
        [self.navigationItem setLeftBarButtonItem:cancelBtn];
        
    }
    return self;
}

- (void)cancelBtnTapped:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[RegisterView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view.btnRegister addTarget:self action:@selector(registerBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)registerBtnTapped:(id)sender{
    
    NSString *path = @"http://volpesalvatore.be/rasal/api/insertUser";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"email": self.view.txtEmail.text,
                             @"password": self.view.txtRepPassword.text,
                             @"naam": self.view.txtLastname.text,
                             @"voornaam": self.view.txtName.text,
                             @"profilePic": [NSString stringWithFormat:@"1.png"]};
    
    [manager POST:path
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) { NSLog(@"JSON: %@", responseObject); }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) { NSLog(@"Error: %@", error); }
     ];
    
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
