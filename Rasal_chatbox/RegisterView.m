//
//  RegisterView.m
//  Rasal
//
//  Created by Volpe Salvatore on 24/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        [self createBackground];
        [self createTextFields];
        [self createButton];
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
    
    // Register
    self.btnRegister = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRegister.frame = CGRectMake(0, 0, 150, 40);
    self.btnRegister.center = CGPointMake(self.frame.size.width/2, self.txtPassword.frame.origin.y + self.txtPassword.frame.size.height + 50);
    [self.btnRegister setBackgroundColor:[UIColor colorWithRed:234.0/255.0 green:84.0/255.0 blue:78.0/255.0 alpha:1.0]];
    self.btnRegister.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:12];
    [self.btnRegister setTitle:@"Register" forState:UIControlStateNormal];
    [self addSubview:self.btnRegister];
    
    self.btnRegister.layer.cornerRadius = 10; // this value vary as per your desire
    //[self.btnRegister setImage:[UIImage imageNamed:@"lock"] forState:UIControlStateNormal];
    self.btnRegister.clipsToBounds = YES;
    
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
