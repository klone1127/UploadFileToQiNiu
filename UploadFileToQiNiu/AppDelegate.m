//
//  AppDelegate.m
//  UploadFileToQiNiu
//
//  Created by jgrm on 2017/6/3.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import "AppDelegate.h"
#import "UploadTools.h"
#import "ShowView.h"
#import "Macros.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)application:(NSApplication *)sender openFile:(NSString *)filename {
    // 更新要显示的图片
    [[NSNotificationCenter defaultCenter] postNotificationName:kRefreshShowViewImg object:nil userInfo:@{kRefreshShowViewImgPath: filename}];
    [UploadTools uploadWithImgPath:filename];
    
    return YES;
}

/**
 左上角点 ☓ 就退出程序(在 Dock 不显示)
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
