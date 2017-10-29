//
//  NSString+Common.h
//  UploadFileToQiNiu
//
//  Created by jgrm on 2017/6/3.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Common)

/**
 获取图片名

 @param imagePath 图片路径
 @return 图片名
 */
+ (NSString *)imageName:(NSString *)imagePath;

@end
