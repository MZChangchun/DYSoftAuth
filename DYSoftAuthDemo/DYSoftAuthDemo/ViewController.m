//
//  ViewController.m
//  aaaaa
//
//  Created by 慕子 on 2017/9/20.
//  Copyright © 2017年 慕子. All rights reserved.
//

#import "ViewController.h"
#import "DYSoftAuth.h"

@interface ViewController ()

@property (nonatomic, assign)BOOL login;
@property (weak, nonatomic) IBOutlet UIView *userInfoView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *headImageLabel;
@property (weak, nonatomic) IBOutlet UILabel *accountLabel;
@property (weak, nonatomic) IBOutlet UILabel *uniqueidLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.logoutButton.alpha = 0;
//    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
}

- (void)showWarningTitle:(NSString *)title message:(NSString *)message {
    UIAlertController * warning  =[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [warning addAction:cancelAction];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:warning animated:YES completion:nil];
    });
}

- (IBAction)loginButtClick:(id)sender {
    __weak typeof(self) weakSelf = self;
    [[DYSoftAuth sharedAuth] beginLogin:^(BOOL success, NSString *localizedDescription, DYSoftUser *user) {
        NSString * title = @"";
        NSString * message = @"";
        if (success) {
            title = @"登陆成功";
            [weakSelf loginSuccess:user];
        } else {
            title = @"登陆失败";
            message = [localizedDescription copy];
        }
        [weakSelf showWarningTitle:title message:message];
    }];
}

- (void)loginSuccess:(DYSoftUser *)user {
    if (user) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.nameLabel.text = user.nickName;
            self.headImageLabel.text = user.headImage;
            self.accountLabel.text = user.account;
            self.uniqueidLabel.text = user.uniqueid;
            self.emailLabel.text = user.email;
            self.logoutButton.alpha = 1;
        });
    } else {
        [self logoutButtCLick:nil];
    }
}


- (IBAction)logoutButtCLick:(id)sender {
    self.nameLabel.text = @" ";
    self.headImageLabel.text = @" ";
    self.accountLabel.text = @" ";
    self.uniqueidLabel.text = @" ";
    self.emailLabel.text = @" ";
    [[DYSoftAuth sharedAuth] logout];
    self.logoutButton.alpha = 0;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
