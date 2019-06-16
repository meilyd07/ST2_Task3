//
//  MainViewController.m
//  ImageLoadApp
//
//  Created by Hanna Rybakova on 6/15/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "MainViewController.h"
#import "ImageTableViewCell.h"

@interface MainViewController () <UITableViewDelegate,UITableViewDataSource, CustomTableViewCellDelegate>
@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) NSArray *urlList;
@end

@implementation MainViewController

NSString * const imageCell = @"imageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self populateData];
    [self setup];
}

- (void)populateData {
    self.urlList = [self.viewModel loadData];
}

- (void)setup {
    self.navigationItem.title = @"Main";
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.table registerClass:[ImageTableViewCell class] forCellReuseIdentifier:imageCell];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview: self.table];
}

#pragma mark - Table Source and Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.urlList.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageTableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:imageCell forIndexPath:indexPath];
    NSLog(@"%ld", (long)indexPath.row);
    cell.cellIndex = indexPath.row;
    cell.descriptionLabel.text = self.urlList[indexPath.row];
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

-(void)didTapImageAtIndex:(NSInteger)index
{
    NSLog(@"Index %ld ", (long)index);
    //Do whatever you want here
}

@end
