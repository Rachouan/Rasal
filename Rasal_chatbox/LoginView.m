//
//  LoginView.m
//  Examen
//
//  Created by Rachouan Rejeb on 21/05/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createBackground];
        [self createTextFields];
        [self createButton];
        
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 220.0, 20)];
        mainLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:22];
        mainLabel.center = CGPointMake(frame.size.width/2, frame.size.height/2 - self.background.frame.size.height - 30);
        mainLabel.text = @"Welcome back";
        [mainLabel setTextAlignment:NSTextAlignmentCenter];
        mainLabel.textColor = [UIColor colorWithRed:234.0/255.0 green:84.0/255.0 blue:78.0/255.0 alpha:1.0];
        [self addSubview:mainLabel];
    }
    return self;
}

-(void)createBackground{
    
    self.background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login-bg"]];
    self.background.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 40);
    [self addSubview:self.background];
    
}

-(void)createTextFields{

    self.txtUsername = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.background.image.size.width - 40, self.background.image.size.height/2)];
    self.txtUsername.placeholder = @"e-mail";
    self.txtUsername.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    self.txtUsername.textColor = [UIColor colorWithRed:17.0f/255.0f green:46.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
    self.txtUsername.frame = CGRectMake(self.background.frame.origin.x +40, self.background.frame.origin.y, self.txtUsername.frame.size.width, self.txtUsername.frame.size.height);
    self.txtUsername.keyboardType = UIKeyboardTypeEmailAddress;
    [self addSubview:self.txtUsername];
    
    
    self.txtPassword = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.background.image.size.width, self.background.image.size.height/2)];
    self.txtPassword.placeholder = @"password";
    self.txtPassword.textColor = [UIColor colorWithRed:17.0f/255.0f green:46.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
    
    self.txtPassword.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    self.txtPassword.frame = CGRectMake(self.background.frame.origin.x + 40 , self.background.frame.origin.y + self.txtUsername.frame.size.height, self.txtPassword.frame.size.width, self.txtPassword.frame.size.height);
    self.txtPassword.secureTextEntry = YES;
    [self addSubview:self.txtPassword];
    
}

-(void)createButton{

    self.btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogin.frame = CGRectMake(0, 0, 180, self.txtPassword.frame.size.height);
    self.btnLogin.center = CGPointMake(self.frame.size.width/2, self.txtPassword.frame.origin.y + self.txtPassword.frame.size.height +60);
    [self.btnLogin setBackgroundColor:[UIColor colorWithRed:234.0/255.0 green:84.0/255.0 blue:78.0/255.0 alpha:1.0]];
    self.btnLogin.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:12];
    [self.btnLogin setTitle:@"   Let’s try to log you in" forState:UIControlStateNormal];
    [self addSubview:self.btnLogin];
    
    self.btnLogin.layer.cornerRadius = 10; // this value vary as per your desire
    [self.btnLogin setImage:[UIImage imageNamed:@"lock"] forState:UIControlStateNormal];
    self.btnLogin.clipsToBounds = YES;
    
    
    UILabel *mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 220.0, 20)];
    mainLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    mainLabel.center = CGPointMake(self.frame.size.width/2 - 40, self.frame.size.height - mainLabel.frame.size.height - 20);
    mainLabel.text = @"Don't have an account?";
    [mainLabel setTextAlignment:NSTextAlignmentCenter];
    mainLabel.textColor = [UIColor colorWithRed:17.0f/255.0f green:46.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
    [self addSubview:mainLabel];
    
    // Register
    self.btnRegister = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRegister.frame = CGRectMake(0, 0, 100, 20);
    self.btnRegister.center = CGPointMake(mainLabel.frame.origin.x + mainLabel.frame.size.width + 5,mainLabel.frame.origin.y + self.btnRegister.frame.size.height/2);
    [self.btnRegister setTitleColor:[UIColor colorWithRed:234.0/255.0 green:84.0/255.0 blue:78.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    self.btnRegister.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    [self.btnRegister setTitle:@"Create one" forState:UIControlStateNormal];
    [self addSubview:self.btnRegister];
    
    self.btnRegister.layer.cornerRadius = 10; // this value vary as per your desire
    [self.btnRegister setImage:[UIImage imageNamed:@"lock"] forState:UIControlStateNormal];
    self.btnRegister.clipsToBounds = YES;
    
}


- (void)errorLogin{
    
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"position"];
    [shake setDuration:0.1];
    [shake setRepeatCount:2];
    [shake setAutoreverses:YES];
    [shake setFromValue:[NSValue valueWithCGPoint:
                         CGPointMake(self.btnLogin.center.x - 5,self.btnLogin.center.y)]];
    [shake setToValue:[NSValue valueWithCGPoint:
                       CGPointMake(self.btnLogin.center.x + 5, self.btnLogin.center.y)]];
    [self.btnLogin.layer addAnimation:shake forKey:@"position"];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
