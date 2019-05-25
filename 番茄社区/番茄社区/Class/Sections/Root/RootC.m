//
//  RootC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "RootC.h"

@interface RootC ()

@end

@implementation RootC


#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self wr_setNavBarShadowImageHidden:YES];
    [self jumpTT];
}
#pragma mark 回调协议

#pragma mark 界面跳转

- (void)JumpTabbar {
    [[TabBarTool Share_TabBarTool]CreateTabBar];
}


#pragma mark 触发方法

- (void)jumpTT {
   [self JumpTabbar];
}

#pragma mark 公开方法

#pragma mark 私有方法

#pragma mark 存取方法

@end
