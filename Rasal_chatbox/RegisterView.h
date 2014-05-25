//
//  RegisterView.h
//  Rasal
//
//  Created by Volpe Salvatore on 24/05/14.
//  Copyright (c) 2014 Volpe Salvatore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView

@property (nonatomic,strong) UIImageView *background;
@property (nonatomic,strong) UITextField *txtName;
@property (nonatomic,strong) UITextField *txtLastname;
@property (nonatomic,strong) UITextField *txtEmail;
@property (nonatomic,strong) UITextField *txtPassword;
@property (nonatomic,strong) UITextField *txtRepPassword;
@property (nonatomic,strong) UIButton *btnRegister;
@property (nonatomic, strong) UIButton * upload;

@property (nonatomic, strong) UIScrollView *scrollView;

@end
