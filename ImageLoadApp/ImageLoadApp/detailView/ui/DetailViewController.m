//
//  DetailViewController.m
//  ImageLoadApp
//
//  Created by Hanna Rybakova on 6/16/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation DetailViewController

- (id) init
{
    self = [super init];
    if (!self) return nil;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(imageLoadedNotification:)
                                                 name:@"ImageLoaded"
                                               object:self.viewModel.path];
    return self;
}

- (void) imageLoadedNotification:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"ImageLoaded"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = [self.viewModel getImage];
        });
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"Details";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(tapBack:)];
    self.imageView = [[UIImageView alloc] initWithImage:[self.viewModel getImage]];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
    [self addDetailViewConstraints];
}

- (void)addDetailViewConstraints {
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    CGFloat ratio = self.imageView.image.size.width / self.imageView.image.size.height;
    [self.imageView.widthAnchor constraintEqualToAnchor:self.imageView.heightAnchor multiplier:ratio constant:1.f].active = YES;
    [self.imageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor
                                             constant:0].active = YES;
    
    [self.imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                             constant:0].active = YES;
    [self.imageView.widthAnchor constraintLessThanOrEqualToAnchor:self.view.widthAnchor multiplier:1.0f].active = YES;
    [self.imageView.heightAnchor constraintLessThanOrEqualToAnchor:self.view.heightAnchor multiplier:1.0f].active = YES;
}

- (void)tapBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
