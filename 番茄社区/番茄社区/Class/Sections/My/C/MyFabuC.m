//
//  MyFabuC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/27.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyFabuC.h"
#import "MyFabuTableV.h"
#import "MyfabuModel.h"
#import "HomecellinfoModel.h"
@interface MyFabuC ()
@property (nonatomic , strong) MyFabuTableV *TableV;
@property (nonatomic , strong) HomeVM *VM;
@end

@implementation MyFabuC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
}

#pragma mark 回调协议

- (void)tt_allClose {
    @weakify(self)
    self.TableV.tapClose = ^(NSInteger num, id data) {
        @strongify(self)
        [self configblogdeleteMyBlog:data];
    };
}
#pragma mark 界面跳转

#pragma mark 触发方法

- (void)configblogdeleteMyBlog:(HomecellinfoModel *)model {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(model.blogId) forKey:@"blogId"];
    [self configDataforNewnetWorkname:blogdeleteMyBlog params:dic networkClass:[HomeAPI class]];
}

#pragma mark 公开方法

- (void)tt_addSubviews {
    [self setupTableV:[MyFabuTableV class]];
    [self setupVM:[HomeVM class]];
    [self tt_allClose];
   
}

- (void)configData {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(self.TableV.Page) forKey:@"page"];
    [self configDataforNewnetWorkname:bloglistMyBlogMARK params:dic networkClass:[HomeAPI class]];
}

- (void)configSuccessTankuang:(NSString *)mark {
    TT_Log(@"%@",mark);
    TT_Log(@"%@",blogdeleteMyBlog);
    if ([mark isEqualToString:blogdeleteMyBlog]) {
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"删除成功"
                                          AndView:self.view AndMode:MBProgressHUDModeText AndImage:@"NNOO"
                                    AndAfterDelay:1
                                          AndBack:^{
        }];
        [self configData];
    }
}

#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.title = @"我的发布";
    [self wr_setNavBarShadowImageHidden:NO];
    
}

#pragma mark 存取方法

@end
