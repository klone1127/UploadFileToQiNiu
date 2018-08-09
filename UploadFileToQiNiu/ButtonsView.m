//
//  ButtonsView.m
//  UploadFileToQiNiu
//
//  Created by CF on 2018/8/8.
//  Copyright © 2018年 klone1127. All rights reserved.
//

#import "ButtonsView.h"

@interface ButtonsView()
@property (weak) IBOutlet NSTextField *accessKeyText;
@property (weak) IBOutlet NSTextField *secretText;
@property (weak) IBOutlet NSTextField *bucketNameText;
@property (weak) IBOutlet NSPopUpButton *selectZoneButton;

@end

@implementation ButtonsView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configSubViews];
}

- (void)configSubViews {
    [self.selectZoneButton removeAllItems];
    [self.selectZoneButton addItemsWithTitles:@[@"请选择", @"华东", @"华北", @"华南", @"北美"]];
    [self.selectZoneButton setAction:@selector(selectionhZoneHandle:)];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:NSControlTextDidChangeNotification object:nil];
}

- (void)textChanged:(NSNotification *)not {
    NSTextField *temp = not.object;
    
    TextFieldENUM tempEnum = ACCESSKEY;
    NSString *value;
    
    if ([temp isEqualTo:self.accessKeyText]) {
        tempEnum = ACCESSKEY;
        value = temp.stringValue;
    } else if ([temp isEqualTo:self.secretText]) {
        tempEnum = SECRET;
        value = temp.stringValue;
    } else if ([temp isEqualTo:self.bucketNameText]) {
        tempEnum = BUCKETNAME;
        value = temp.stringValue;
    }
    
    if (self.textFieldInput) {
        self.textFieldInput(tempEnum, value);
    }
    
}

- (void)selectionhZoneHandle:(NSPopUpButton *)sender {
    NSLog(@"%ld", (long)sender.indexOfSelectedItem);
    if (self.selectedItemBlock) {
        self.selectedItemBlock(sender.indexOfSelectedItem);
    }
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
