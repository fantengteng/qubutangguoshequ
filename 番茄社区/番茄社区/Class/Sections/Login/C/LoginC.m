//
//  LoginC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "LoginC.h"
#import "RegisterV.h"
#import "loginV.h"
@interface LoginC ()
@property (nonatomic , strong) RegisterV *Regist;
@property (nonatomic , strong) loginV *Login;
@property (nonatomic , strong) HomeVM *VM;
@end

@implementation LoginC


#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark 回调协议

- (void)tt_allClose {
    @weakify(self)
    self.Regist.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (num == -1) {
            [self jumpzhuce:1];
        }else if (num == 1) {
            [self sure_loginOrRegistType:0 dic:data];
        }else if (num == 4) {
            [self jumpDetailC:@"https://zzyuanshun.cn/smart-api/doc/detail?deviceType=2&version=1.0.0&appCode=bbs5&type=service_protocol"];
        }
        
        else {
            [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"请输入账号或密码"
                                              AndView:self.view
                                              AndMode:MBProgressHUDModeText
                                             AndImage:@"NONONO"
                                        AndAfterDelay:1
                                              AndBack:nil];
        }
    };
    
    self.Login.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (num == -1) {
            [self jumpzhuce:0];
        }else if (num == 1) {
            [self sure_loginOrRegistType:1 dic:data];
        }else if (num == 4) {
            [self jumpDetailC:@"https://zzyuanshun.cn/smart-api/doc/detail?deviceType=2&version=1.0.0&appCode=bbs5&type=service_protocol"];
        }
        
        else {
            [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"请输入账号或密码"
                                              AndView:self.view
                                              AndMode:MBProgressHUDModeText
                                             AndImage:@"NONONO"
                                        AndAfterDelay:1
                                              AndBack:nil];
        }
       
    };
}

#pragma mark 界面跳转

- (void)jumpDetailC:(NSString *)url{
    CurrenC *CC = [[CurrenC alloc]init];
    CC.web_url = url;
    [self JumpController:CC];
}

#pragma mark 触发方法

- (void)jumpzhuce:(NSInteger)type {
    if (type == 1) {
        self.title = @"注册";
        [self.Regist removeFromSuperview];
        [self.view addSubview:self.Login];
        
    }else {
        self.title = @"登录";
        [self.Login removeFromSuperview];
        [self.view addSubview:self.Regist];
    }
}

#pragma mark 公开方法

- (void)tt_addSubviews {
    self.title = @"登录";
    [self setupVM:[HomeVM class]];
    [self.view addSubview:self.Regist];
    [self tt_allClose];
}

- (void)sure_loginOrRegistType:(NSInteger)type dic:(NSMutableDictionary *)dic{
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"正在提交数据"
                                      AndView:self.view
                                      AndMode:MBProgressHUDModeIndeterminate
                                     AndImage:@"NONONO"
                                      AndBack:nil];
    NSString *netName;
    if (type == 0) {
        netName = LoginMARK;
    }else {
        netName = RegistMARK;
    }
    [self configDataforNewnetWorkname:netName
                               params:dic
                         networkClass:[HomeAPI class]];
}


- (void)configSuccessTankuang:(NSString *)mark {
    [[FTT_HudTool share_FTT_HudTool]dissmiss];
    NSString *STR;
    if ([mark isEqualToString:LoginMARK]) {
        STR = @"登录成功";
    }else if ([mark isEqualToString:RegistMARK]) {
        STR = @"注册成功";
    }
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:STR
                                      AndView:self.view
                                      AndMode:MBProgressHUDModeText
                                     AndImage:@"NONONO"
                                AndAfterDelay:1
                                      AndBack:^{
                                          [[TabBarTool Share_TabBarTool]CreateTabBar];
                                      }];
}

- (void)configFailTankuang:(NSString *)mark {
    [[FTT_HudTool share_FTT_HudTool]dissmiss];
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"请求失败,请重试!!!"
                                      AndView:self.view
                                      AndMode:MBProgressHUDModeText
                                     AndImage:@"NONONO"
                                AndAfterDelay:1
                                      AndBack:nil];
}
#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
}

#pragma mark 存取方法

- (RegisterV *)Regist {
    if (!_Regist) {
        IPhoneXHeigh
        _Regist = [[[NSBundle mainBundle] loadNibNamed:@"RegisterV" owner:self options:nil] lastObject];;
        _Regist.frame = CGRectMake(0, securitytop_Y, KScreenWidth, security_H);
    }
    return _Regist;
}

- (loginV *)Login {
    if (!_Login) {
        IPhoneXHeigh
        _Login = [[[NSBundle mainBundle] loadNibNamed:@"loginV" owner:self options:nil] lastObject];;
        _Login.frame = CGRectMake(0, securitytop_Y, KScreenWidth, security_H);
    }
    return _Login;
}
@end
