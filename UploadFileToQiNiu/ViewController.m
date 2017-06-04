//
//  ViewController.m
//  UploadFileToQiNiu
//
//  Created by jgrm on 2017/6/3.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import "ViewController.h"
#import "ShowImageView.h"
#import "ShowView.h"
#import <QiniuSDK.h>
#import <CommonCrypto/CommonCrypto.h>
#import <os/activity.h>
#import "NSString+Common.h"
#import "NSString+QiNiu.h"

@interface ViewController()<GetImagePathDelegate>

@property (nonatomic, strong)ShowView    *showView;
@property (nonatomic, copy)NSString *token;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showView = [[ShowView alloc] init];
    [self.view addSubview:self.showView];
    self.showView.getImagePathDelegate = self;
    [self.showView loadView:self.view];
    
    self.token = [self token];
}

- (void)getImagePath:(NSString *)path {
    NSString *imageName = [NSString imageName:path];
    [self uploadWithToken:self.token imageName:imageName path:path];
}

- (NSString *)token {
    NSString *accessKey = @"DoBVQEyHluJ27PPgPBIfp93HvfkloUSBc9aEBc9I";
    NSString *secret = @"添加七牛密钥";
    NSString *bucketName = @"blog";
    return [NSString getQiNiuToken:accessKey secretKey:secret bucketName:bucketName deadline:1];
}

- (void)uploadWithToken:(NSString *)token imageName:(NSString *)imageName path:(NSString *)path {
    
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
                      if (info.ok) {
                          [self showUploadSuccess:[NSString stringWithFormat:@"%@/%@", info.serverIp, key]];
                      }
                  } option:nil];
}

- (void)showUploadSuccess:(NSString *)string {
    NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = @"上传成功";
    [alert addButtonWithTitle:@"好的"];
    alert.alertStyle = NSAlertStyleWarning;
    
    [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow completionHandler:^(NSModalResponse returnCode) {
        NSLog(@"点击确定按钮了");
    }];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
