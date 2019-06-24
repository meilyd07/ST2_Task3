//
//  MainViewController.m
//  ImageLoadApp
//
//  Created by Hanna Rybakova on 6/15/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "MainViewController.h"
#import "ImageTableViewCell.h"
#import "DetailViewController.h"
#import "DetailViewModel.h"

@interface MainViewController () <UITableViewDelegate,UITableViewDataSource, CustomTableViewCellDelegate>
@property (strong, nonatomic) UITableView *table;
@property (assign, nonatomic) NSInteger lastPush;
@end

@implementation MainViewController

NSString * const imageCell = @"imageCell";

- (id) init
{
    self = [super init];
    if (!self) return nil;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(imageLoadedNotification:)
                                                 name:@"ImageLoaded"
                                               object:nil];
    return self;
}

- (void) imageLoadedNotification:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"ImageLoaded"]) {
        if (notification.userInfo[@"cellIndex"]) {
            NSString *cellIndexString = notification.userInfo[@"cellIndex"];
            NSInteger celIndexInteger = [cellIndexString integerValue];
            dispatch_async(dispatch_get_main_queue(), ^{
                NSIndexPath *path = [NSIndexPath indexPathForRow:celIndexInteger inSection:0];
                ImageTableViewCell *updateCell = (ImageTableViewCell *)[self.table cellForRowAtIndexPath: path];
                if (updateCell) {
                    [self.table reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
                }
            });
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self populateData];
    [self setup];
}

- (void)populateData {
    [self.viewModel loadData];
    [self.viewModel loadImages];
    self.lastPush = -1;
}

- (void)setup {
    self.navigationItem.title = @"Main";
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.table registerClass:[ImageTableViewCell class] forCellReuseIdentifier:imageCell];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview: self.table];
    [self addConstraintToTable];
    
}

- (void)addConstraintToTable {
    self.table.translatesAutoresizingMaskIntoConstraints = NO;
    [self.table.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor
                                             constant:0].active = YES;
    [self.table.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor
                                         constant:0].active = YES;
    [self.table.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                            constant:0].active = YES;
    [self.table.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor
                                             constant:0].active = YES;
}

#pragma mark - Table Source and Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel getDataCount];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageTableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:imageCell forIndexPath:indexPath];
    cell.cellIndex = indexPath.row;
    cell.descriptionLabel.text = [self.viewModel getDescription:indexPath.row];
    cell.delegate = self;
    cell.tableImageView.image = [self.viewModel getImage:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

-(void)didTapImageAtIndex:(NSInteger)index
{
    self.lastPush = index;
    DetailViewController *detailVC = [DetailViewController new];
    detailVC.viewModel = [self.viewModel getDetailViewModel:index];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.lastPush > 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.lastPush inSection:0];
        [self.table scrollToRowAtIndexPath:indexPath
                             atScrollPosition:UITableViewScrollPositionTop
                                     animated:YES];
    }
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
