//
//  ShowView.h
//  UploadFileToQiNiu
//
//  Created by jgrm on 2017/6/3.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ShowImageView.h"

@protocol GetImagePathDelegate <NSObject>

- (void)getImagePath:(NSString *)path;

@end

@interface ShowView : NSView

@property (nonatomic, strong)ShowImageView *showImageView;
@property (nonatomic, weak)id<GetImagePathDelegate>  getImagePathDelegate;

/**
 添加到 view, frame 等于 view

 @param view superView
 */
- (void)loadView:(NSView *)view;

@end
