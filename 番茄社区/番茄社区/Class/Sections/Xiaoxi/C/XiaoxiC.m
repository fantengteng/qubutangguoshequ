//
//  MyC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "XiaoxiC.h"

@interface XiaoxiC ()

@end

@implementation XiaoxiC


#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark 回调协议

#pragma mark 界面跳转

#pragma mark 触发方法

#pragma mark 公开方法

#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.title = @"我的消息";
    [self wr_setNavBarShadowImageHidden:NO];
    [self setupNothingVforImgaeName:@"meijilu"
                          titleName:@"没有记录"
                              Frame:self.view.bounds
                             is_Tap:NO];

}





#pragma mark 存取方法

@end
