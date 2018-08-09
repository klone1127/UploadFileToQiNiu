//
//  ButtonsView.h
//  UploadFileToQiNiu
//
//  Created by CF on 2018/8/8.
//  Copyright © 2018年 klone1127. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef enum : NSUInteger {
    ACCESSKEY = 0,
    SECRET,
    BUCKETNAME,
} TextFieldENUM;

typedef void(^SelectedItem)(NSInteger index);
typedef void (^TextFieldInput)(TextFieldENUM textField, NSString *value);

@interface ButtonsView : NSView

@property (nonatomic, copy) SelectedItem selectedItemBlock;
@property (nonatomic, copy) TextFieldInput textFieldInput;

@end
