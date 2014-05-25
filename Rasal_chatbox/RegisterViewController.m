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
    [self.view.upload addTarget:self action:@selector(addOrTakePicture:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addOrTakePicture:(id)sender{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Way to upload your profile picture" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Take picture" otherButtonTitles:@"Choose a picture", nil];
    [actionSheet showInView:self.view];
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
             
                 /*[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isUserLoggedIn"];
                 [[NSUserDefaults standardUserDefaults] setInteger:self.current_user.identifier forKey:@"current_user"];*/
            
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

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%d", buttonIndex);
    
    switch (buttonIndex) {
        case 0:
            [self takePicture];
            break;
        case 1:
            [self chooseAPicture];
            break;
        case 2:
            [actionSheet dismissWithClickedButtonIndex:2 animated:YES];
            break;
    }
}

- (void)takePicture{
    NSLog(@"Take Picture");
    
    self.cameraImagePC = [[UIImagePickerController alloc] init];
    self.cameraImagePC.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.cameraImagePC.cameraDevice = UIImagePickerControllerCameraDeviceFront;
   // self.cameraImagePC.cameraOverlayView = [self loadViewForTakingPicture];
   // self.cameraImagePC.showsCameraControls = NO;
    
    [self presentViewController:self.cameraImagePC animated:YES completion:^{}];
    self.cameraImagePC.delegate = self;
}

- (void)chooseAPicture{
    NSLog(@"Choose Picture");
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imagePicker animated:YES completion:^{}];
    imagePicker.delegate = self;
}

/*- (void)shotPicture:(id)sender{
    [self.cameraImagePC takePicture];
}

- (UIView *)loadViewForTakingPicture{
    
    int heightBtn = 80;
    
    UIView *overlayShotPicture = [[UIView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - heightBtn), self.view.frame.size.width, heightBtn)];
    [self.view addSubview:overlayShotPicture];
    
    UIImage *upload = [UIImage imageNamed:@"upload"];
    
    UIButton *takePicture= [UIButton buttonWithType:UIButtonTypeCustom];
    [takePicture setBackgroundImage:upload forState:UIControlStateNormal];
    takePicture.frame = CGRectMake(0, 0, upload.size.width, upload.size.height);
    [takePicture setBackgroundColor:[UIColor whiteColor]];
//    takePicture.center = CGPointMake(self.view.frame.size.width / 2, (self.view.frame.size.height - upload.size.height) - 50);
    takePicture.center = CGPointMake(self.view.frame.size.width / 2, 200);
    [overlayShotPicture addSubview:takePicture];
    
    [takePicture addTarget:self action:@selector(shotPicture:) forControlEvents:UIControlEventTouchUpInside];
    
    return overlayShotPicture;
}
*/

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    self.current_user_image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.current_user_image_data = [[NSData alloc] initWithContentsOfURL:[info objectForKey:UIImagePickerControllerReferenceURL]];
    
    [self updatePictureOnRegisterView];
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

- (void)updatePictureOnRegisterView{
    NSLog(@"Update Picture");
    [self.view.upload setBackgroundImage:self.current_user_image forState:UIControlStateNormal];
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
