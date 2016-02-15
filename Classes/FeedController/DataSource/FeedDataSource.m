//
//  FeedDataSource.m
//  VKFeed
//
//  Created by danny on 12.02.16.
//  Copyright © 2016 danny. All rights reserved.
//

#import "FeedDataSource.h"
#import "ApiHelper.h"
#import "TableViewLoadingCell.h"
#import "TableViewErrorCell.h"
#import "FeedCell.h"
#import "FeedItem.h"

static NSString *FeedCellId = @"FeedCell";

@interface FeedDataSource ()

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) BOOL allPagedLoaded;
@property (nonatomic, strong) TableViewErrorCell *errorCell;
@property (nonatomic, strong) TableViewLoadingCell *loadingCell;
@property (nonatomic, assign) DataSourceState state;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

- (void)loadCurrentPage;

@end

@implementation FeedDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        _items = [NSMutableArray array];
        _loadingCell = [[TableViewLoadingCell alloc] init];
        _errorCell = [[TableViewErrorCell alloc] init];
    }
    return self;
}

- (void)refresh {
    self.state = StateEmpty;
    self.page = 0;
}

- (void)setPage:(NSInteger)page {
    _page = page;
    [self loadCurrentPage];
}

- (void)loadCurrentPage {
    if (self.state == StateLoading) {
        return;
    }
    self.state = StateLoading;
    NSIndexPath *errorIndexPath = [self.tableView indexPathForCell:self.errorCell];
    if (errorIndexPath) {
        [self.tableView reloadRowsAtIndexPaths:@[errorIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    __weak typeof(self) weakSelf = self;
    NSInteger page = self.page;
    [ApiHelper getWallItemsForPage:page success:^(NSArray *items, BOOL allPagesLoaded, BOOL fromCache) {
        [weakSelf.refreshControl endRefreshing];
        weakSelf.allPagedLoaded = allPagesLoaded;
        if (!fromCache) {
            weakSelf.state = StateReady;
        }
        if (page == 0) {
            [weakSelf.items removeAllObjects];
        }
        [weakSelf.items addObjectsFromArray:items];
        [weakSelf.tableView reloadData];
    } failure:^(NSError *error) {
        [weakSelf.refreshControl endRefreshing];
        weakSelf.state = StateFailed;
        [weakSelf.errorCell updateWithError:error];
        NSIndexPath *loadingIndexPath = [weakSelf.tableView indexPathForCell:weakSelf.loadingCell];
        if (loadingIndexPath) {
            [self.tableView reloadRowsAtIndexPaths:@[loadingIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }];
}

- (void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:FeedCellId bundle:nil] forCellReuseIdentifier:FeedCellId];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    [_tableView insertSubview:self.refreshControl atIndex:0];
    [self refresh];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!self.allPagedLoaded) {
        return self.items.count + 1;
    }
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.items.count) {
        FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:FeedCellId];
        [cell updateWithFeedItem:self.items[indexPath.row]];
        return cell;
    }
    if (self.state == StateFailed) {
        return self.errorCell;
    }
    self.page++;
    return self.loadingCell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.items.count ||
        self.state == StateFailed) {
        return UITableViewAutomaticDimension;
    }
    return 44.0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row >= self.items.count ||
        self.state == StateFailed) {
        [self loadCurrentPage];
    }
}

@end
