//
//  XCViewController.m
//  BlobPrivateComponentDemo
//
//  Created by fanxiaocong on 12/27/2019.
//  Copyright (c) 2019 fanxiaocong. All rights reserved.
//

#import "XCViewController.h"

// 导入组件库中的类
#import <BlobPrivateComponentDemo/XCCustomerView.h>
// 因为组件中已经依赖了 XCMacros 库，因此可以直接导入
#import <XCMacros/XCMacros.h>

@interface XCViewController ()

@end

@implementation XCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /// 设置 UI
    [self setupUI];
}

#pragma mark - ✏️ 🖼 SetupUI Method 🖼

- (void)setupUI
{
    // 使用组件库中的类
    XCCustomerView *view = [XCCustomerView customerView];
    CGFloat w = CGRectGetWidth(view.bounds);
    CGFloat h = CGRectGetHeight(view.bounds);
    CGFloat x = (SCREEN_WIDTH - w) * 0.5;
    CGFloat y = (SCREEN_HEIGHT - h) * 0.5;
    view.frame = CGRectMake(x, y, w, h);
    [self.view addSubview:view];
}

@end
