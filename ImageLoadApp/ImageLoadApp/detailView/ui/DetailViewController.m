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
    self.imageView = [[UIImageView alloc] initWithImage:[self.viewModel getImage]];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
    [self addDetailViewConstraints];
}

- (void)addDetailViewConstraints {
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-10];
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:10];
    [self.view addConstraints:@[top, trailing, leading]];
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
