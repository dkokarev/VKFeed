//
//  FeedViewController.m
//  VKFeed
//
//  Created by danny on 12.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import "FeedViewController.h"
#import <VK-ios-sdk/VKSdk.h>
#import "ApiHelper.h"
#import "FeedDataSource.h"

#import "LoginViewController.h"
#import "AccessToken.h"
#import "User.h"

@interface FeedViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) FeedDataSource *dataSource;

- (void)signOut:(id)sender;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Wall";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign out" style:UIBarButtonItemStylePlain target:self action:@selector(signOut:)];
    
    AccessToken *accessToken = [AccessToken currentToken];
    if (!accessToken.isValid) {
        [self presentLoginController];
    }
    
    self.dataSource = [[FeedDataSource alloc] init];
    self.dataSource.tableView = self.tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self.tableView reloadData];
    } completion:nil];
}

- (void)signOut:(id)sender {
    [User setCurrentUser:nil];
    [self presentLoginController];
}

- (void)presentLoginController {
    LoginViewController *controller = [[LoginViewController alloc] init];
    [controller setDidLoginHandler:^{
        [self.dataSource refresh];
    }];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:navController animated:YES completion:nil];
}

@end
