//
//  NSAlert+Common.m
//  UploadFileToQiNiu
//
//  Created by CF on 2017/10/29.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import "NSAlert+Common.h"

@implementation NSAlert (Common)

/**
 显示上传结果
 
 @param string
 @param suc 是否成功
 */
+ (void)showAlertMsg:(NSString *)string suc:(BOOL)suc {
    NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = suc ? @"上传成功" : @"上传失败";
    [alert addButtonWithTitle:@"好的"];
    alert.informativeText = string;
    alert.alertStyle = NSAlertStyleInformational;
    [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow completionHandler:^(NSModalResponse returnCode) {
        NSLog(@"点击确定按钮了");
    }];
}

@end
