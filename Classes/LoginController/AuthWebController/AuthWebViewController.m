//
//  AuthWebViewController.m
//  VKFeed
//
//  Created by danny on 15.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import "AuthWebViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "NSString+Util.h"
#import "UIAlertController+Utils.h"
#import "AccessToken.h"
#import "ApiHelper.h"
#import "User.h"

static NSString * const VK_APP_ID = @"5290047";

@interface AuthWebViewController () <UIWebViewDelegate>

@property (nonatomic, weak) IBOutlet UIWebView *webView;

- (void)close:(id)sender;

@end

@implementation AuthWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"VK";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(close:)];
    NSHTTPCookieStorage *sharedStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in sharedStorage.cookies) {
        [sharedStorage deleteCookie:cookie];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.vk.com/oauth/authorize?client_id=%@&scope=wall&redirect_uri=http://api.vk.com/blank.html&display=touch&response_type=token", VK_APP_ID]] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30.0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *urlString = webView.request.URL.absoluteString;
    if ([urlString rangeOfString:@"access_token"].location != NSNotFound) {
        NSString *accessToken = [urlString substringBetweenString:@"access_token=" andString:@"&"];
        NSString *expireIn = [urlString substringBetweenString:@"&expires_in=" andString:@"&user_id="];
        NSString *userId = [urlString componentsSeparatedByString:@"&user_id="].lastObject;
        NSDate *expireDate = [[NSDate date] dateByAddingTimeInterval:expireIn.doubleValue];
        if (self.tokenHandler) {
            self.tokenHandler([AccessToken accessTokenWithToken:accessToken userId:userId expireDate:expireDate]);
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
