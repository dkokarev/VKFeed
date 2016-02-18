//
//  LoginViewController.m
//  VKFeed
//
//  Created by danny on 12.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import "LoginViewController.h"
#import "UIAlertController+Utils.h"
#import "ApiHelper.h"
#import "AuthWebViewController.h"
#import "AccessToken.h"
#import "User.h"

@interface LoginViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *users;

- (void)loginWithVKAction:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Login";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign In" style:UIBarButtonItemStylePlain target:self action:@selector(loginWithVKAction:)];
    self.users = [User authenticatedUsers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loginWithVKAction:(id)sender {
    AuthWebViewController *controller = [[AuthWebViewController alloc] init];
    [controller setTokenHandler:^(AccessToken *accessToken) {
        NSError *error;
        [AccessToken addToken:accessToken error:&error];
        if (error) {
            [UIAlertController presentWithMessage:error.localizedDescription inController:self];
            return;
        }
        [ApiHelper getUserWithId:accessToken.userId success:^(User *user, BOOL fromCache) {
            [self showFeedForUser:user];
        } failure:^(NSError *apiError) {
            if (apiError) {
                [UIAlertController presentWithMessage:apiError.localizedDescription inController:self];
            }
        }];
    }];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)showFeedForUser:(User *)user {
    [User setCurrentUser:user];
    if (self.didLoginHandler) {
        self.didLoginHandler();
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"loginCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    User *user = self.users[indexPath.row];
    cell.textLabel.text = user.fullname;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    User *user = self.users[indexPath.row];
    AccessToken *accessToken = [AccessToken tokenWithUserId:user.userId.stringValue];
    if ([accessToken isValid]) {
        [self showFeedForUser:self.users[indexPath.row]];
    } else {
        [self loginWithVKAction:nil];
    }
}

@end
