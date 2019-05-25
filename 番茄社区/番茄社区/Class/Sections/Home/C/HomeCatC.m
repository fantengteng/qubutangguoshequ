//
//  HomeCatC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeCatC.h"
#import "HomeCatDetailC.h"
#import "HomeCatTableV.h"
#import "HomeCatModel.h"
#import "FabuinfoC.h"
@interface HomeCatC ()
@property (nonatomic , strong) HomeCatTableV *TableV;
@property (nonatomic , strong) HomeVM *VM;
@end

@implementation HomeCatC

#pragma mark 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tt_getNewDate];
}

#pragma mark 回调协议

- (void)tapcellTriggereventIndex:(NSIndexPath *)index model:(id)model {
    if (self.type == 1) {
         [self jumpHomeCatDetailC:model];
    }else {
        [self jumpFabuC:model];
    }
}

#pragma mark 界面跳转

- (void)jumpHomeCatDetailC:(HomeCatModel *)model {
    HomeCatDetailC *CC = [[HomeCatDetailC alloc]init];
    CC.model = model;
    [self JumpController:CC];
}

- (void)jumpFabuC:(HomeCatModel *)model {
    FabuinfoC *FC = [[FabuinfoC alloc]init];
    FC.cat_id = model.categoryId;
    [self.navigationController pushViewController:FC animated:YES];
}

#pragma mark 触发方法

#pragma mark 公开方法

- (void)tt_addSubviews {
    [self setupTableV:[HomeCatTableV class]];
    [self setupVM:[HomeVM class]];
}

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.title = @"选择分类";
    [self wr_setNavBarShadowImageHidden:NO];
}

- (void)tt_getNewDate {
    [self configDataforNewnetWorkname:bloglistCategoryMAKR
                               params:[NSMutableDictionary new]
                         networkClass:[HomeAPI class]];
}

#pragma mark 私有方法

#pragma mark 存取方法


@end
