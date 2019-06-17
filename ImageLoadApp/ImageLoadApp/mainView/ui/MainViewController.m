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
// (strong, nonatomic) NSArray *urlList;
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
            NSLog(@"got it");
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
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.table attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.table attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.table attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.table attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0];
    [self.view addConstraints:@[leading, trailing, top, bottom]];
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
    DetailViewController *detailVC = [DetailViewController new];
    DetailViewModel *detailVM = [DetailViewModel new];
    detailVC.viewModel = detailVM;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
