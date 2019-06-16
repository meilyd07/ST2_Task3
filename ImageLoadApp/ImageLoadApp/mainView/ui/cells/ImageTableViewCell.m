//
//  ImageTableViewCell.m
//  ImageLoadApp
//
//  Created by Hanna Rybakova on 6/15/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "ImageTableViewCell.h"

@interface ImageTableViewCell()
@property (nonatomic, strong) UIImageView* tableImageView;
@end

@implementation ImageTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.descriptionLabel.textColor = [UIColor blackColor];
        self.descriptionLabel.numberOfLines = 0;
        self.descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        [self.contentView addSubview:self.descriptionLabel];
        
        self.tableImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noImage"]];
        [self.contentView addSubview:self.tableImageView];
        [self addConstraintToCell];
        [self.tableImageView setUserInteractionEnabled:YES];
        [self addGestures];
    }
    return self;
}

- (void)addGestures {
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                  initWithTarget:self action:@selector(didTapImage:)];
    tapGesture.numberOfTapsRequired = 1;
    [self.tableImageView addGestureRecognizer:tapGesture];
}

- (void)didTapImage:(UITapGestureRecognizer *)gesture
{
    if (_delegate) {
        [_delegate didTapImageAtIndex:self.cellIndex];
    }
}

- (void)addConstraintToCell {
    self.tableImageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:self.tableImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute  multiplier:1 constant:150];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.tableImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute  multiplier:1 constant:150];
    NSLayoutConstraint *centerImageY = [NSLayoutConstraint constraintWithItem:self.tableImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.tableImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:10];
    [self.contentView addConstraint:leading];
    [self.contentView addConstraint:width];
    [self.contentView addConstraint:height];
    [self.contentView addConstraint:centerImageY];
    
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:10];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-40];
    NSLayoutConstraint *distance = [NSLayoutConstraint constraintWithItem:self.tableImageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.descriptionLabel attribute:NSLayoutAttributeLeading multiplier:1 constant:-10];

    [self.contentView addConstraint:top];
    [self.contentView addConstraint:trailing];
    [self.contentView addConstraint:distance];
}

@end
