//
//  LoginViewController.m
//  HuanXinChat
//
//  Created by baijf on 12/24/15.
//  Copyright © 2015 Junne. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}

- (IBAction)loginAction:(id)sender {
    
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:@"52111111" password:@"123456" completion:^(NSDictionary *loginInfo, EMError *error) {
        
        if (loginInfo && !error) {
            [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
            NSLog(@"登录成功");

            [self performSegueWithIdentifier:@"Main" sender:nil];
        }
    } onQueue:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
