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
#import "UploadTools.h"
#import "NSAlert+Common.h"
#import "Macros.h"
#import "ButtonsView.h"
#import "NSView+NibLoading.h"

@interface ViewController()<GetImagePathDelegate>

@property (nonatomic, strong)ShowView    *showView;
@property (nonatomic, copy)NSString *token;
@property (nonatomic, strong) ButtonsView *buttonsView;
@property (nonatomic, strong) UploadTools *tools;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tools = [[UploadTools alloc] init];
    
    [self setupButtonsView];
    [self setupShowView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshShowViewImg:) name:kRefreshShowViewImg object:nil];
}

- (void)setupButtonsView {
    self.buttonsView = [NSView loadWithNibNamed:@"ButtonsViewNib" class:[ButtonsView class] owner:self];
    self.buttonsView.frame = NSMakeRect(0, 0, self.view.frame.size.width, 157);
    [self.view addSubview:self.buttonsView];
    
    __weak typeof(self)weakSelf = self;
    self.buttonsView.selectedItemBlock = ^(NSInteger index) {
        NSLog(@"当前选择：%ld", index);
        weakSelf.tools.zone = index;
    };
    
    self.buttonsView.textFieldInput = ^(TextFieldENUM textField, NSString *value) {
        NSLog(@"%ld, value:%@", textField, value);
        switch (textField) {
            case ACCESSKEY:
                weakSelf.tools.accessKey = value;
                break;
            case SECRET:
                weakSelf.tools.secret = value;
                break;
            case BUCKETNAME:
                weakSelf.tools.bucketName = value;
                break;
            default:
                break;
        }
    };
}

- (void)setupShowView {
    self.showView = [[ShowView alloc] init];
    [self.view addSubview:self.showView];
    self.showView.getImagePathDelegate = self;
    [self.showView loadView:self.view];
}

- (void)refreshShowViewImg:(NSNotification *)not {
    [self.showView showImg:[not.userInfo objectForKey:kRefreshShowViewImgPath]];
}

- (void)getImagePath:(NSString *)path {
    // TODO: 数据为空时不上传
    // TODO: 数据填写后保存到本地，并添加清除按钮
    [self.tools uploadWithImgPath:path];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
    
