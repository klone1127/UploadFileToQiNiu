//
//  UploadTools.h
//  UploadFileToQiNiu
//
//  Created by CF on 2017/10/29.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QiniuSDK.h>

typedef enum : NSUInteger {
    华东 = 1,
    华北,
    华南,
    北美
} ZoneEnum;

typedef void(^UploadSuccess)();
typedef void(^UploadFailure)();

@interface UploadTools : NSObject

@property (nonatomic, copy) NSString *accessKey;
@property (nonatomic, copy) NSString *secret;
@property (nonatomic, copy) NSString *bucketName;
@property (nonatomic, assign) NSInteger zone;

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

- (void)uploadWithImgPath:(NSString *)path;
@end
