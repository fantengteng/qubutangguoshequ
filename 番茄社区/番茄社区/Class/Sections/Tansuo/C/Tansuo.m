//
//  MyC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "Tansuo.h"
#import "TansuoTableV.h"
#import "TansuoModel.h"
@interface Tansuo ()

@property (nonatomic , strong) TansuoTableV *TableV;
@property (nonatomic , strong) HomeVM *VM;

@end

@implementation Tansuo


#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark 回调协议

- (void)tapcellTriggereventIndex:(NSIndexPath *)index model:(TansuoModel *)model {
    [self jumpDetailC:model.detailLink];
}

#pragma mark 界面跳转

- (void)jumpDetailC:(NSString *)url{
    CurrenC *CC = [[CurrenC alloc]init];
    CC.web_url = url;
    [self JumpController:CC];
}


#pragma mark 触发方法



#pragma mark 公开方法

- (void)tt_addSubviews {
    IPhoneXHeigh
    [self setupTableV:[TansuoTableV class] Frame:CGRectMake(0, securitytop_Y, KScreenWidth, security_H - 49)];
    [self setupVM:[HomeVM class]];
    self.TableV.is_refreshHeader = YES;
    self.TableV.is_refreshfoot = YES;
}


- (void)configData {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(self.TableV.Page) forKey:@"page"];
    [self configDataforNewnetWorkname:doclistExploreMARK params:dic networkClass:[HomeAPI class]];
}


#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.title = @"探索";
    [self wr_setNavBarShadowImageHidden:NO];
}



#pragma mark 存取方法



@end
