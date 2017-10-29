//
//  ShowView.m
//  UploadFileToQiNiu
//
//  Created by jgrm on 2017/6/3.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import "ShowView.h"
#import <Masonry.h>

@interface ShowView()<DragResultDelegate>

@end

@implementation ShowView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)loadView:(NSView *)view {
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(view);
    }];
    
    self.showImageView = [[ShowImageView alloc] init];
    [self addSubview:self.showImageView];
    self.showImageView.dragResultDelegate = self;
    self.showImageView.layer.backgroundColor = [NSColor cyanColor].CGColor;
    
    [self.showImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).with.offset(20);
        make.right.bottom.equalTo(self).with.offset(-20);
    }];
    self.showImageView.image = [NSImage imageNamed:@"plus"];
}

- (void)dragedImageList:(NSArray *)list {
    NSLog(@"image List:%@", list);
    if (self.getImagePathDelegate && [self.getImagePathDelegate respondsToSelector:NSSelectorFromString(@"getImagePath:")]) {
        [self.getImagePathDelegate getImagePath:[list lastObject]];
    }
}

- (void)showImg:(NSString *)imgPath {
//    self.showImageView.image = [NSImage image];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
