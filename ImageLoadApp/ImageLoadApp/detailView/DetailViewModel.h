//
//  DetailViewModel.h
//  ImageLoadApp
//
//  Created by Hanna Rybakova on 6/16/19.
//  Copyright © 2019 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DetailViewModel : NSObject
@property (nonatomic, strong, readonly) NSString *path;
- (id)initWithCache:(NSCache *)imageCache forUrlString:(NSString *)path;
- (UIImage *)getImage;
@end
