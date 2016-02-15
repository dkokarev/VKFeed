//
//  LoginViewController.m
//  VKFeed
//
//  Created by danny on 12.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import "LoginViewController.h"
#import <VK-ios-sdk/VKSdk.h>

@interface LoginViewController () <VKSdkUIDelegate>

- (IBAction)loginWithVKAction:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Login";
    [[VKSdk instance] setUiDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)loginWithVKAction:(id)sender {
    [VKSdk authorize:@[@"wall"]];
}

#pragma mark - VKSdkUIDelegate

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    VKCaptchaViewController *captchaController = [VKCaptchaViewController captchaControllerWithError:captchaError];
    [captchaController presentIn:self];
}

@end
