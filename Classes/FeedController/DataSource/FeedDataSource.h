//
//  FeedDataSource.h
//  VKFeed
//
//  Created by danny on 12.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    StateEmpty,
    StateLoading,
    StateReady,
    StateFailed
} DataSourceState;

@interface FeedDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

- (void)refresh;

@end
