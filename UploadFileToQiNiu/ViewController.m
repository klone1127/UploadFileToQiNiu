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
}

- (void)getImagePath:(NSString *)path {
    [UploadTools uploadWithImgPath:path];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
