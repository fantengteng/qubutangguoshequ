//
//  MydianzanC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MydianzanC.h"
#import "HomeTableV.h"
#import "HomecellinfoModel.h"
#import "HomeDetailC.h"
@interface MydianzanC ()
@property (nonatomic , strong) HomeTableV *TableV;
@property (nonatomic , strong) HomeVM *VM;
@end

@implementation MydianzanC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
}
#pragma mark 回调协议

- (void)tapcellTriggereventIndex:(NSIndexPath *)index model:(id)model {
    [self jumpHomeDetailC:model];
}

#pragma mark 界面跳转

- (void)jumpHomeDetailC:(HomecellinfoModel *)model {
    HomeDetailC *DC = [[HomeDetailC alloc]init];
    DC.model = model;
    [self JumpController:DC];
}


#pragma mark 触发方法

#pragma mark 公开方法

- (void)tt_addSubviews {
    [self setupTableV:[HomeTableV class]];
    self.TableV.Page = 0;
    [self setupVM:[HomeVM class]];
    
}

- (void)configData {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(self.TableV.Page) forKey:@"page"];
    [self configDataforNewnetWorkname:bloglistMyLikeMARK params:dic networkClass:[HomeAPI class]];
}

#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.title = @"我的点赞";
    [self wr_setNavBarShadowImageHidden:NO];
}

#pragma mark 存取方法




@end
