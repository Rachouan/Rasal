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
    self.notEmptyTextfieldsArray = [NSMutableArray array];
    
    NSString *path = @"http://volpesalvatore.be/rasal/api/insertUser";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"email": self.view.txtEmail.text,
                             @"password": self.view.txtRepPassword.text,
                             @"naam": self.view.txtLastname.text,
                             @"voornaam": self.view.txtName.text,
                             @"profilePic": [NSString stringWithFormat:@"1.png"]};

    
    for (UITextField *currentTxt in self.view.textFieldsArray) {
        
        if (currentTxt.text.length > 0) {
            currentTxt.backgroundColor = [UIColor whiteColor];
            currentTxt.textColor = [UIColor colorWithRed:17.0f/255.0f green:46.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
            [self.notEmptyTextfieldsArray addObject:currentTxt];
        }else{
            currentTxt.backgroundColor = [UIColor colorWithRed:0.92 green:0.33 blue:0.31 alpha:1];
            currentTxt.textColor = [UIColor whiteColor];
        }
        
        if (self.notEmptyTextfieldsArray.count == 5) {
            NSLog(@"READY TO GO");
            [manager POST:path
             parameters:params
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 [self.view endEditing:YES];
             
                 self.current_user = [UserFactory createUserWithDictionary:responseObject];
                 
                 NSLog(@"%@", self.current_user);
             
                 [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isUserLoggedIn"];
                 [[NSUserDefaults standardUserDefaults] setInteger:self.current_user.identifier forKey:@"current_user"];
            
             }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) { NSLog(@"Error: %@", error);}
             ];
            
            [self dismissViewControllerAnimated:YES completion:^{}];
        }else{
            [self.view errorRegister];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
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
