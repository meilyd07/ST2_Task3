//
//  ImageTableViewCell.m
//  ImageLoadApp
//
//  Created by Hanna Rybakova on 6/15/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 300, 30)];
        self.descriptionLabel.textColor = [UIColor blackColor];
        self.descriptionLabel.numberOfLines = 0;
        self.descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        [self.contentView addSubview:self.descriptionLabel];
        
        self.image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noImage"]];
        [self.contentView addSubview:self.image];
        [self addConstraintToCell];
    }
    return self;
}

- (void)addConstraintToCell {
    self.image.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:self.image attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute  multiplier:1 constant:150];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.image attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute  multiplier:1 constant:150];
    NSLayoutConstraint *centerImageY = [NSLayoutConstraint constraintWithItem:self.image attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:self.image attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0f constant:10];
    [self.contentView addConstraint:leading];
    [self.contentView addConstraint:width];
    [self.contentView addConstraint:height];
    [self.contentView addConstraint:centerImageY];
    
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:10];
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:self.descriptionLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-40];
    NSLayoutConstraint *distance = [NSLayoutConstraint constraintWithItem:self.image attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.descriptionLabel attribute:NSLayoutAttributeLeading multiplier:1 constant:-10];

    [self.contentView addConstraint:top];
    [self.contentView addConstraint:trailing];
    [self.contentView addConstraint:distance];
}

@end
