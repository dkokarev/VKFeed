//
//  TableViewErrorCell.h
//  VKFeed
//
//  Created by danny on 14.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewErrorCell : UITableViewCell

- (void)updateWithError:(NSError *)error;

@end
