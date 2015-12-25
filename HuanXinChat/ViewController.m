//
//  ViewController.m
//  HuanXinChat
//
//  Created by baijf on 12/24/15.
//  Copyright © 2015 Junne. All rights reserved.
//

#import "ViewController.h"
#import "ChatViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)chat:(id)sender {
    
    ChatViewController *chatController = [[ChatViewController alloc] initWithConversationChatter:@"8002" conversationType:eConversationTypeChat];
    chatController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
