//
//  LoginView.h
//  Examen
//
//  Created by Rachouan Rejeb on 21/05/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LoginView : UIView

@property (nonatomic,strong)UIImageView *background;
@property (nonatomic,strong)UITextField *txtUsername;
@property (nonatomic,strong)UITextField *txtPassword;
@property (nonatomic,strong)UIButton *btnLogin;
@property (nonatomic, strong) UIImageView * imageview;

- (void)errorLogin;

@end
