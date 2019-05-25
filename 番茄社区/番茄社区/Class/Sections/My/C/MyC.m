//
//  MyC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyC.h"
#import "MyTableV.h"
#import "MydianzanC.h"
#import "MyguanzhuC.h"
#import "MySetupC.h"
#import "MyPhoneC.h"
#import "MyFabuC.h"
#import "MypingbiC.h"
#import "MyinfoC.h"
@interface MyC ()
@property (nonatomic , strong) MyTableV *TableV;
@end

@implementation MyC


#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self wr_setNavBarBackgroundAlpha:0];
    [self.TableV configName];
}

#pragma mark 回调协议

- (void)tapcellTriggereventIndex:(NSIndexPath *)index model:(id)model {
    [[TabBarTool Share_TabBarTool]configisLoginv:self];
    if (index.row == 0) {
        [self jumpMyguanzhuC];
    }else if (index.row == 1) {
        [self jumoMyfabuC];
    }else if (index.row == 2) {
        [self jumpPypingbiC];
    }else if (index.row == 3) {
        [self jumpMyphoneC];
    }else if (index.row == 4) {
        [self jumMydianzanC];
    }else if (index.row == 5) {
        [self jumpSetupC];
    }
}

#pragma mark 界面跳转

- (void)jumpMyguanzhuC {
    MyguanzhuC *GC = [[MyguanzhuC alloc]init];
    [self JumpController:GC];
}

- (void)jumoMyfabuC {
    MyFabuC *MF = [[MyFabuC alloc]init];
    [self JumpController:MF];
}

- (void)jumMydianzanC {
    MydianzanC *DZ = [[MydianzanC alloc]init];
    [self JumpController:DZ];
}

- (void)jumpPypingbiC {
    MypingbiC *PC = [[MypingbiC alloc]init];
    [self JumpController:PC];
}
- (void)jumpMyphoneC {
    MyPhoneC *PC = [[MyPhoneC alloc]init];
    [self JumpController:PC];
}

- (void)jumpSetupC {
    MySetupC *SC = [[MySetupC alloc] initWithNibName:@"MySetupC" bundle:nil];
    [self.navigationController pushViewController:SC animated:YES];
}

- (void)jumpMyinfoC {
    MyinfoC *MC = [[MyinfoC alloc] initWithNibName:@"MyinfoC" bundle:nil];
    [self.navigationController pushViewController:MC animated:YES];
}


#pragma mark 触发方法

#pragma mark 公开方法

#pragma mark 私有方法

- (void)tt_addSubviews {
    IPhoneXHeigh
    [self setupTableV:[MyTableV class] Frame:CGRectMake(0, 0, KScreenWidth,KScreenHeight - 49 - securityBottom_H)];
    @weakify(self)
    self.TableV.tapClose = ^(NSInteger num, id data) {
        @strongify(self)
        if (num == 1) {
            [self jumpMyinfoC];
        }else {
            [[TabBarTool Share_TabBarTool]configisLoginv:self];
        }
    };
}

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.title = @"个人中心";
    [self wr_setNavBarBackgroundAlpha:0];
}

#pragma mark 存取方法

@end
