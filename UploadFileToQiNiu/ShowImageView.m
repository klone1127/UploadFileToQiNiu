//
//  ShowImageView.m
//  UploadFileToQiNiu
//
//  Created by jgrm on 2017/6/3.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import "ShowImageView.h"

@implementation ShowImageView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self defaultConf];
    }
    return self;
}

- (void)defaultConf {
    self.layer.backgroundColor = [NSColor cyanColor].CGColor;
}

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender {
    NSPasteboard *pastedboard = [sender draggingPasteboard];
    if ([[pastedboard types] containsObject:NSFilenamesPboardType]) {
        return NSDragOperationCopy;
    }
    
    return NSDragOperationNone;
}

- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender {
    
    NSPasteboard *pastedBoard = [sender draggingPasteboard];
    NSArray *typeList = [pastedBoard propertyListForType:NSFilenamesPboardType];
    
    if (self.dragResultDelegate && [self.dragResultDelegate respondsToSelector:@selector(dragedImageList:)]) {
        [self.dragResultDelegate dragedImageList:typeList];
    }
    
    return YES;
    
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
