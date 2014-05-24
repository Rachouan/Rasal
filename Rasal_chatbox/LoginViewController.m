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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
}

-(void)loginButtonTapped:(id)sender{
    
    NSLog(@"[LOGIN]");
    
    if( [self.view.txtUsername.text isEqualToString:@"devine"] && [self.view.txtPassword.text isEqualToString:@"test"]){
        
        NSLog(@"CORRECT");
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isUserLoggedIn"];
        
        [self.view endEditing:YES];
        
        [self.view.btnLogin setImage:[UIImage imageNamed:@"unlock"] forState:UIControlStateNormal];
        
        [self performSelector:@selector(login) withObject:self afterDelay:3.0 ];
    
        
    }else{
        
        [self.view errorLogin];
        
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isUserLoggedIn"];
    }
    
}

-(void)login{
    
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
