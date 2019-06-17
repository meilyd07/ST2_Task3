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
@property (nonatomic, strong) NSCache *imageCache;
-(NSArray *)loadData;
- (void)loadImages;
@end
