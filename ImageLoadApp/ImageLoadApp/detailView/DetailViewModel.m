//
//  DetailViewModel.m
//  ImageLoadApp
//
//  Created by Hanna Rybakova on 6/16/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "DetailViewModel.h"
@interface DetailViewModel()
@property (nonatomic, strong) NSCache *imageCache;
@end

@implementation DetailViewModel
-(id)initWithCache:(NSCache *)imageCache forUrlString:(NSString *)path {
    self = [super init];
    if (self) {
        _imageCache = imageCache;
        _path = path;
    }
    return self;
}

- (UIImage *)getImage {
    UIImage *imageFromCache = [self.imageCache objectForKey:self.path];
    if (imageFromCache) {
        return imageFromCache;
    } else {
        return [UIImage imageNamed:@"noImage"];
    }
}
@end
