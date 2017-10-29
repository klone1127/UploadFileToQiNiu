//
//  UploadTools.m
//  UploadFileToQiNiu
//
//  Created by CF on 2017/10/29.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import "UploadTools.h"
#import "NSString+Common.h"
#import "NSString+QiNiu.h"
#import "NSAlert+Common.h"

#define kBucketName     @"blog"
#define kAccessKey      @""
#define kSecret         @""

@implementation UploadTools

+ (void)uploadWithImgPath:(NSString *)path {
    [UploadTools getImagePath:path completionHandle:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        // 成功
        if (resp != nil) {
            NSLog(@"上传成功: %@", info);
            [NSAlert showAlertMsg:[NSString stringWithFormat:@"%@/%@", info.serverIp, key] suc:YES];
        } else { //  失败
            NSLog(@"上传失败: %@", info);
            [NSAlert showAlertMsg:[NSString stringWithFormat:@"错误码：%d \n 错误信息：%@", info.statusCode, info.error] suc:NO];
        }
    }];
}

+ (void)getImagePath:(NSString *)path completionHandle:(QNUpCompletionHandler)completionHandle {
    [[UploadTools alloc] getImagePath:path completionHandle:completionHandle];
}

- (void)getImagePath:(NSString *)path completionHandle:(QNUpCompletionHandler)completionHandle {
    NSString *imageName = [NSString imageName:path];
    [self uploadWithToken:[self token] imageName:imageName path:path completionHandle:completionHandle];
}

/**
 配置要上传到的空间，获取到 token

 @return token
 */
- (NSString *)token {
    NSString *accessKey = kAccessKey;
    NSString *secret = kSecret;
    NSString *bucketName = kBucketName;
    return [NSString getQiNiuToken:accessKey secretKey:secret bucketName:bucketName deadline:1];
}


/**
 上传至七牛云

 @param token
 @param imageName
 @param path
 @param success 
 */
- (void)uploadWithToken:(NSString *)token imageName:(NSString *)imageName path:(NSString *)path completionHandle:(QNUpCompletionHandler)completionHandle {
    
    QNConfiguration *config = [QNConfiguration build:^(QNConfigurationBuilder *builder) {
        builder.zone = [QNZone zone2];
    }];
    
    QNUploadManager *uploadManager = [[QNUploadManager alloc] initWithConfiguration:config];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    [uploadManager putData:data
                       key:imageName
                     token:token
                  complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                      NSLog(@"info:%@", info);
                      completionHandle(info, key, resp);
                  } option:nil];
}

@end
