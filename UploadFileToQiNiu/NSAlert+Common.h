//
//  NSAlert+Common.h
//  UploadFileToQiNiu
//
//  Created by CF on 2017/10/29.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSAlert (Common)

/**
 显示上传结果
 
 @param string
 @param suc 是否成功
 */
+ (void)showAlertMsg:(NSString *)string suc:(BOOL)suc;

@end
