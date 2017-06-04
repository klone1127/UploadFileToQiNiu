//
//  NSString+Common.m
//  UploadFileToQiNiu
//
//  Created by jgrm on 2017/6/3.
//  Copyright © 2017年 klone1127. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)

+ (NSString *)imageName:(NSString *)imagePath {
    
    NSMutableArray *dotArray = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *slashArray = [NSMutableArray arrayWithCapacity:0];
    NSString *newString;

    [slashArray addObjectsFromArray:[NSString substringAfterString:imagePath flag:@"/"]];
    newString = [imagePath stringByReplacingCharactersInRange:NSMakeRange(0, [[slashArray lastObject] integerValue] + 1) withString:@""];
    
    [dotArray addObjectsFromArray:[NSString substringAfterString:newString flag:@"."]];
    NSRange dotRange = NSMakeRange([[dotArray lastObject] integerValue], newString.length - [[dotArray lastObject] integerValue]);
    newString = [newString stringByReplacingCharactersInRange:dotRange withString:@""];

    return newString;
    
}

+ (NSArray *)substringAfterString:(NSString *)sourceString flag:(NSString *)flagString {
    
    __block NSMutableArray *flagStringArray = [NSMutableArray arrayWithCapacity:0];
    [sourceString enumerateSubstringsInRange:NSMakeRange(0, sourceString.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        
        if ([substring isEqualToString:flagString]) {
            NSLog(@"current %@ range:%luld",sourceString, (unsigned long)substringRange.location);
            [flagStringArray addObject:@(substringRange.location)];
        }
        
    }];
    
    return flagStringArray;
}

@end
