//
//  FeedCell.h
//  VKFeed
//
//  Created by danny on 12.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FeedItem;

@interface FeedCell : UITableViewCell

- (void)updateWithFeedItem:(FeedItem *)item;

@end
