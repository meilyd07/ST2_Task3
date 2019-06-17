//
//  ImageTableViewCell.h
//  ImageLoadApp
//
//  Created by Hanna Rybakova on 6/15/19.
//  Copyright © 2019 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomTableViewCellDelegate <NSObject>

- (void)didTapImageAtIndex:(NSInteger)index;

@end

@interface ImageTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, assign) NSInteger cellIndex;
@property (nonatomic, weak) id<CustomTableViewCellDelegate>delegate;
@property (nonatomic, strong) UIImageView* tableImageView;
@end
