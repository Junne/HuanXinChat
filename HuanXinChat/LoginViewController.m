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
            [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:NO];
            
            // 旧数据转换 (如果您的sdk是由2.1.2版本升级过来的，需要家这句话)
//            [[EaseMob sharedInstance].chatManager importDataToNewDatabase];
//            //获取数据库中数据
//            [[EaseMob sharedInstance].chatManager loadDataFromDatabase];
//            
//            //获取群组列表
//            [[EaseMob sharedInstance].chatManager asyncFetchMyGroupsList];
            [self saveLastLoginUsername];


            [self performSegueWithIdentifier:@"Main" sender:nil];
        }
    } onQueue:nil];
    
}

- (void)saveLastLoginUsername
{
    NSString *username = [[[EaseMob sharedInstance].chatManager loginInfo] objectForKey:kSDKUsername];
    if (username && username.length > 0) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:username forKey:[NSString stringWithFormat:@"em_lastLogin_%@",kSDKUsername]];
        [ud synchronize];
    }
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
