//
//  MainViewModel.h
//  ImageLoadApp
//
//  Created by Hanna Rybakova on 6/15/19.
//  Copyright © 2019 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MainViewModel : NSObject
- (void)loadData;
- (void)loadImages;
- (NSInteger)getDataCount;
- (NSString *)getDescription:(NSInteger)index;
- (UIImage *)getImage:(NSInteger)index;
@end
