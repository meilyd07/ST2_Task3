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
@property (strong, nonatomic) NSArray *urlList;

@property (nonatomic, strong) NSOperationQueue *imageOperationQueue;
@property (nonatomic, strong) NSCache *imageCache;
@end

@implementation MainViewController

NSString * const imageCell = @"imageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageOperationQueue = [[NSOperationQueue alloc]init];
    //self.imageOperationQueue.maxConcurrentOperationCount = 4;
    self.imageCache = [[NSCache alloc] init];
    
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
    
    NSString *imageUrlString = self.urlList[indexPath.row];
    cell.descriptionLabel.text = imageUrlString;
    cell.delegate = self;
    
    UIImage *imageFromCache = [self.imageCache objectForKey:imageUrlString];
    
    if (imageFromCache) {
        cell.tableImageView.image = imageFromCache;
        //[cell.tableImageView setFrame: ]; // set frame
    }
    else
    {
        //cell.tableImageView.image = [UIImage imageNamed:@"noPhoto"];
        //[cell.tableImageView setFrame:CGRectZero];
        
        [self.imageOperationQueue addOperationWithBlock:^{
            NSURL *imageurl = [NSURL URLWithString:imageUrlString];
            UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageurl]];
            
            if (img != nil) {
                [self.imageCache setObject:img forKey:imageUrlString];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    ImageTableViewCell *updateCell = (ImageTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
                    if (updateCell) {
                        //[updateCell.tableImageView setFrame:...];
                        [updateCell.tableImageView setImage:img];
                    }
                }];
            }
        }];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

-(void)didTapImageAtIndex:(NSInteger)index
{
    //DetailViewController *vc = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    //vc.person = [self.viewModel getContactBySection:cellIndexSection row:cellIndexRow];
    DetailViewController *detailVC = [DetailViewController new];
    DetailViewModel *detailVM = [DetailViewModel new];
    detailVC.viewModel = detailVM;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
