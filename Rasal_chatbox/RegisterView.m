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
        
        self.textFieldsArray = [NSMutableArray array];
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, - 64, frame.size.width, frame.size.height + 64)];
        self.scrollView.contentSize = CGSizeMake(frame.size.width, frame.size.height + 300);
        [self addSubview:self.scrollView];
        
        [self createBackground];
        [self createTextFields];
        [self createButton];
        
        UILabel *mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 220.0, 20)];
        mainLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:20];
        mainLabel.center = CGPointMake(frame.size.width/2, self.background.frame.origin.y - mainLabel.frame.size.height - 10);
        mainLabel.text = @"Upload a picture";
        [mainLabel setTextAlignment:NSTextAlignmentCenter];
        mainLabel.textColor = [UIColor colorWithRed:234.0/255.0 green:84.0/255.0 blue:78.0/255.0 alpha:1.0];
        [self.scrollView addSubview:mainLabel];
        
        UIImage *upload = [UIImage imageNamed:@"upload"];
        
        self.upload = [UIButton buttonWithType:UIButtonTypeCustom];
        self.upload.frame = CGRectMake(0, 0, upload.size.width, upload.size.height);
        self.upload.center = CGPointMake(self.frame.size.width/2, mainLabel.frame.origin.y - self.upload.frame.size.height/2 - 20);
        [self.upload setBackgroundImage:upload forState:UIControlStateNormal];
        [self.scrollView addSubview:self.upload];
        
    }
    return self;
}

-(void)createBackground{
    
    self.background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"register"]];
    self.background.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 + 40);
    [self.scrollView addSubview:self.background];
    
}

-(void)createTextFields{
    
    
    int txtFieldHeight = self.background.frame.size.height/5;
    
    self.txtLastname = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.background.image.size.width - 45, txtFieldHeight - 10)];
    self.txtLastname.placeholder = @"Last-name";
    self.txtLastname.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    self.txtLastname.textColor = [UIColor colorWithRed:17.0f/255.0f green:46.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
    self.txtLastname.frame = CGRectMake(self.background.frame.origin.x + 40, self.background.frame.origin.y + 5, self.txtLastname.frame.size.width, self.txtLastname.frame.size.height);
    self.txtLastname.keyboardType = UIKeyboardTypeEmailAddress;
    self.txtLastname.layer.cornerRadius = 5;
    self.txtLastname.tag = 0;
    self.txtLastname.returnKeyType = UIReturnKeyNext;
    [self.textFieldsArray addObject:self.txtLastname];
    [self.scrollView addSubview:self.txtLastname];
    
    
    self.txtName = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.background.image.size.width - 45, txtFieldHeight - 10)];
    self.txtName.placeholder = @"Name";
    self.txtName.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    self.txtName.textColor = [UIColor colorWithRed:17.0f/255.0f green:46.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
    self.txtName.frame = CGRectMake(self.background.frame.origin.x + 40, self.txtLastname.frame.origin.y+self.txtName.frame.size.height + 10, self.txtName.frame.size.width, self.txtName.frame.size.height);
    self.txtName.keyboardType = UIKeyboardTypeEmailAddress;
    self.txtName.tag = 1;
    self.txtName.returnKeyType = UIReturnKeyNext;
    self.txtName.layer.cornerRadius = 5;
    [self.textFieldsArray addObject:self.txtName];
    [self.scrollView addSubview:self.txtName];
    
    
    self.txtEmail = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.background.image.size.width - 45, txtFieldHeight - 10)];
    self.txtEmail.placeholder = @"E-mail";
    self.txtEmail.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    self.txtEmail.textColor = [UIColor colorWithRed:17.0f/255.0f green:46.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
    self.txtEmail.frame = CGRectMake(self.background.frame.origin.x +40, self.txtName.frame.origin.y+self.txtEmail.frame.size.height + 10, self.txtEmail.frame.size.width, self.txtEmail.frame.size.height);
    self.txtEmail.keyboardType = UIKeyboardTypeEmailAddress;
    self.txtEmail.tag = 2;
    self.txtEmail.returnKeyType = UIReturnKeyNext;
    self.txtEmail.layer.cornerRadius = 5;
    [self.textFieldsArray addObject:self.txtEmail];
    [self.scrollView addSubview:self.txtEmail];
    
    
    self.txtPassword = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.background.image.size.width - 45, txtFieldHeight - 10)];
    self.txtPassword.placeholder = @"Password";
    self.txtPassword.textColor = [UIColor colorWithRed:17.0f/255.0f green:46.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
    self.txtPassword.layer.cornerRadius = 5;
    self.txtPassword.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    self.txtPassword.frame = CGRectMake(self.background.frame.origin.x + 40 , self.txtEmail.frame.origin.y+self.txtPassword.frame.size.height + 10, self.txtPassword.frame.size.width, self.txtPassword.frame.size.height);
    self.txtPassword.secureTextEntry = YES;
    self.txtPassword.tag = 3;
    self.txtPassword.returnKeyType = UIReturnKeyNext;
    [self.textFieldsArray addObject:self.txtPassword];
    [self.scrollView addSubview:self.txtPassword];
    
    
    
    self.txtRepPassword = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.background.image.size.width - 45, txtFieldHeight - 10)];
    self.txtRepPassword.placeholder = @"Repeat password";
    self.txtRepPassword.textColor = [UIColor colorWithRed:17.0f/255.0f green:46.0f/255.0f blue:66.0f/255.0f alpha:1.0f];
    self.txtRepPassword.layer.cornerRadius = 5;
    self.txtRepPassword.font = [UIFont fontWithName:@"Avenir-Medium" size:14];
    self.txtRepPassword.frame = CGRectMake(self.background.frame.origin.x + 40 , self.txtPassword.frame.origin.y+self.txtRepPassword.frame.size.height + 10, self.txtRepPassword.frame.size.width, self.txtRepPassword.frame.size.height);
    self.txtRepPassword.secureTextEntry = YES;
    self.txtRepPassword.tag = 4;
    self.txtEmail.returnKeyType = UIReturnKeyDone;
    [self.textFieldsArray addObject:self.txtRepPassword];
    [self.scrollView addSubview:self.txtRepPassword];
    
    
    
}

-(void)createButton{
    
    // Register
    self.btnRegister = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnRegister.frame = CGRectMake(0, 0, 150, 40);
    self.btnRegister.center = CGPointMake(self.frame.size.width/2, self.txtRepPassword.frame.origin.y + self.txtRepPassword.frame.size.height + 50);
    [self.btnRegister setBackgroundColor:[UIColor colorWithRed:234.0/255.0 green:84.0/255.0 blue:78.0/255.0 alpha:1.0]];
    self.btnRegister.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:12];
    [self.btnRegister setTitle:@"Register" forState:UIControlStateNormal];
    [self.scrollView addSubview:self.btnRegister];
    self.btnRegister.layer.cornerRadius = 10;
    self.btnRegister.tag = 5;
    self.btnRegister.clipsToBounds = YES;
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)sender
{
    if(sender.returnKeyType == UIReturnKeyNext){
        // Make something else first responder
    }else if(sender.returnKeyType == UIReturnKeyGo){
        // Do something
    }else{
        [sender resignFirstResponder];
    }
    return YES;
}

- (void)errorRegister{
    
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"position"];
    [shake setDuration:0.1];
    [shake setRepeatCount:2];
    [shake setAutoreverses:YES];
    [shake setFromValue:[NSValue valueWithCGPoint:
                         CGPointMake(self.btnRegister.center.x - 5,self.btnRegister.center.y)]];
    [shake setToValue:[NSValue valueWithCGPoint:
                       CGPointMake(self.btnRegister.center.x + 5, self.btnRegister.center.y)]];
    [self.btnRegister.layer addAnimation:shake forKey:@"position"];
    
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
