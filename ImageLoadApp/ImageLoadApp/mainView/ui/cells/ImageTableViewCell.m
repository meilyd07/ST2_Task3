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
    self.tableImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.tableImageView.clipsToBounds = YES;
    self.tableImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.tableImageView.layer.borderWidth = 1;
    [self.tableImageView.widthAnchor constraintEqualToConstant:150.0f].active = YES;
    [self.tableImageView.heightAnchor constraintEqualToConstant:150.0f].active = YES;
    [self.tableImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
    [self.tableImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10.0f].active = YES;
    
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.descriptionLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10.0f].active = YES;
    [self.descriptionLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-40.0f].active = YES;
    [self.tableImageView.trailingAnchor constraintEqualToAnchor:self.descriptionLabel.leadingAnchor constant:-10.0f].active = YES;
}

@end
