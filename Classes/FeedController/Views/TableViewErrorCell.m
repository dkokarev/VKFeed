//
//  TableViewErrorCell.m
//  VKFeed
//
//  Created by danny on 14.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import "TableViewErrorCell.h"

@interface TableViewErrorCell ()

@property (nonatomic, strong) UILabel *mainLabel;

@end

@implementation TableViewErrorCell

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    if (!_mainLabel) {
        _mainLabel = [[UILabel alloc] init];
        _mainLabel.textAlignment = NSTextAlignmentCenter;
        _mainLabel.numberOfLines = 0;
        _mainLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_mainLabel];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-8-[_mainLabel]-8-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_mainLabel)]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[_mainLabel]-8-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_mainLabel)]];
    }
}

- (void)updateWithError:(NSError *)error {
    self.mainLabel.text = error.localizedDescription;
}

@end
