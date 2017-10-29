//
//  UploadTools.h
//  UploadFileToQiNiu
//
//  Created by CF on 2017/10/29.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QiniuSDK.h>

typedef void(^UploadSuccess)();
typedef void(^UploadFailure)();

@interface UploadTools : NSObject

/**
 上传至七牛云服务器

 @param path 图片路径
 @param completionHandle 上传完成后的回调函数
 */
+ (void)getImagePath:(NSString *)path completionHandle:(QNUpCompletionHandler)completionHandle;

/**
 通过图片路径上传至七牛

 @param path
 */
+ (void)uploadWithImgPath:(NSString *)path;
@end
