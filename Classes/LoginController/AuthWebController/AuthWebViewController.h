//
//  AuthWebViewController.h
//  VKFeed
//
//  Created by danny on 15.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccessToken;

@interface AuthWebViewController : UIViewController

@property (nonatomic, copy) void(^tokenHandler)(AccessToken *token);

@end
