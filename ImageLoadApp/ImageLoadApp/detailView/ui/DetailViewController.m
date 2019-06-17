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
            [self.view layoutIfNeeded];
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
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:68];

    CGFloat ratio = self.imageView.image.size.width / self.imageView.image.size.height;
    NSLayoutConstraint *ratioConstraint = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.imageView
                                                                       attribute:NSLayoutAttributeHeight
                                                                      multiplier:ratio
                                                                        constant:1.f];
    [self.imageView addConstraint:ratioConstraint];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0];
    [self.view addConstraints:@[top, height, leading, width]];
}

- (void)tapBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
