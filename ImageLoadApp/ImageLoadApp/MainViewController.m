//
//  MainViewController.m
//  ImageLoadApp
//
//  Created by Hanna Rybakova on 6/15/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "MainViewController.h"
#import "ImageTableViewCell.h"

@interface MainViewController () <UITableViewDelegate,UITableViewDataSource>
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
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.table registerClass:UITableViewCell.class forCellReuseIdentifier:imageCell];
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
    ImageTableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:imageCell];
    if (cell == nil) {
        cell = [[ImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:imageCell];
    }
    cell.descriptionLabel = self.urlList[indexPath.row];
    return cell;
}

@end
