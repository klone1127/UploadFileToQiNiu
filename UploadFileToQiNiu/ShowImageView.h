//
//  ShowImageView.h
//  UploadFileToQiNiu
//
//  Created by jgrm on 2017/6/3.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol DragResultDelegate <NSObject>

- (void)dragedImageList:(NSArray *)list;

@end

@interface ShowImageView : NSImageView

@property (nonatomic, weak)id<DragResultDelegate> dragResultDelegate;

@end
