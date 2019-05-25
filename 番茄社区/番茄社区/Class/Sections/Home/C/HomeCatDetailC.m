//
//  HomeCatDetailC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeCatDetailC.h"
#import "HomeTableV.h"
#import "HomeDetailC.h"
#import "HomecellinfoModel.h"
@interface HomeCatDetailC ()
@property (nonatomic , strong) HomeTableV *TableV;
@property (nonatomic , strong) HomeVM *VM;
@end

@implementation HomeCatDetailC



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
    [self setupVM:[HomeVM class]];
    self.TableV.is_hideHeader = 0;
}

- (void)configData {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(self.TableV.Page) forKey:@"page"];
    [dic setValue:@(self.model.categoryId) forKey:@"categoryId"];
    [self configDataforNewnetWorkname:bloglistBlogMAKR
                               params:dic
                         networkClass:[HomeAPI class]];
}
#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.title = self.model.name;
    [self wr_setNavBarShadowImageHidden:NO];
    
}

#pragma mark 存取方法

@end
