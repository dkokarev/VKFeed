//
//  FeedCell.m
//  VKFeed
//
//  Created by danny on 12.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import "FeedCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImage+Utils.h"
#import "FeedItem.h"
#import "Attachment.h"
#import "PhotoSource.h"
#import "User.h"

@interface FeedCell ()

@property (nonatomic, weak) IBOutlet UIImageView *profileImageView;
@property (nonatomic, weak) IBOutlet UILabel *fullnameLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UILabel *mainLabel;
@property (nonatomic, weak) IBOutlet UILabel *likesLabel;
@property (nonatomic, weak) IBOutlet UILabel *commentsLabel;
@property (nonatomic, weak) IBOutlet UILabel *repostsLabel;
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, weak) id<SDWebImageOperation> profileImageOperation;

@end

@implementation FeedCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _images = [NSMutableArray array];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.profileImageOperation cancel];
    self.profileImageView.image = nil;
    [self.images makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.images removeAllObjects];
}

- (void)updateWithFeedItem:(FeedItem *)item {
    __weak typeof(self) weakSelf = self;
    self.profileImageOperation = [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:item.user.largestSource.url] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (!image) {
            return;
        }
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *roundedImage = [image roundedImageForSize:weakSelf.profileImageView.frame.size];
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.profileImageView.image = roundedImage;
            });
        });
    }];
     
    self.fullnameLabel.text = item.user.fullname;
    self.dateLabel.text = item.formattedDate;
    self.mainLabel.text = item.text;
    self.likesLabel.text = item.likesCount.stringValue;
    self.commentsLabel.text = item.commentsCount.stringValue;
    self.repostsLabel.text = item.repostsCount.stringValue;
    NSMutableDictionary *views = [NSMutableDictionary dictionary];
    views[@"mainLabel"] = self.mainLabel;
    views[@"likesLabel"] = self.likesLabel;
    views[@"profileImageView"] = self.profileImageView;
    NSString *format = @"";
    NSArray *attachments = item.attachments.allObjects;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    for (Attachment *attachment in attachments) {
        NSUInteger index = [attachments indexOfObject:attachment];
        CGFloat height;
        if (attachment.height.floatValue > 0) {
            height = attachment.height.floatValue * width / attachment.width.floatValue;
        } else {
            height = width;
        }
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:imageView];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"|[imageView(==%0.f)]|", width] options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(imageView)]];
        views[[NSString stringWithFormat:@"imageView%lu", (unsigned long)index]] = imageView;
        if (index == 0) {
            format = [format stringByAppendingFormat:@"V:%@[imageView%lu(==%0.f)]%@", (item.text.length)?@"[mainLabel]-8-":@"[profileImageView]-8-", (unsigned long)index, height, (attachments.count == 1)?@"-13-[likesLabel]":@"-4-"];
        } else if (index == attachments.count - 1) {
            format = [format stringByAppendingFormat:@"[imageView%lu(==%0.f)]-13-[likesLabel]", (unsigned long)index, height];
        } else {
            format = [format stringByAppendingFormat:@"[imageView%lu(==%0.f)]-4-", (unsigned long)index, height];
        }
        [imageView sd_setImageWithURL:[NSURL URLWithString:attachment.largestSource.url] placeholderImage:[UIImage imageWithColor:[UIColor lightGrayColor]]];
        [self.images addObject:imageView];
    }
    if (format.length) {
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:views]];
    }
}

@end
