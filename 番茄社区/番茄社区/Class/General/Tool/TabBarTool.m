//
//  TabBarTool.m
//  捕鱼达人
//
//  Created by linlin dang on 2019/3/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TabBarTool.h"
#import "AppDelegate.h"
#import "JMTabBarController.h"
#import "HomeC.h"
#import "MyC.h"
#import "LoginC.h"
#import "XiaoxiC.h"
#import "Tansuo.h"
@interface TT_BaseNavigationController : UINavigationController

@end

@implementation TT_BaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        if (!IPHONE_X) {
            viewController.hidesBottomBarWhenPushed = YES;
        }else {
            viewController.hidesBottomBarWhenPushed = YES;
        }
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

@end

@implementation TabBarTool

+ (instancetype)Share_TabBarTool {
    static TabBarTool *TT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TT = [[TabBarTool alloc]init];
    });
    return TT;
}

- (void)configisLoginv:(UIViewController *)V {
    USER_ID
    if ([usee_id isEqualToString:@""]) {
        [FTT_Helper CreateTitle:@"提示"
                        message:@"需要登录，才能使用此功能"
                   CantionTitle:@"取消"
                           Sure:@"登录"
                 preferredStyle:UIAlertControllerStyleAlert
                         SureAC:^{
                             [[TabBarTool Share_TabBarTool]CreateLoginC:V];
                         } NoAC:^{
                             
                         } ViewController:V];
        return;
    }
}

- (void)islogin:(UIViewController *)V Close:(void(^)(void))Close {
    USER_ID
    if ([usee_id isEqualToString:@""]) {
        [FTT_Helper CreateTitle:@"提示"
                        message:@"需要登录，才能使用此功能"
                   CantionTitle:@"取消"
                           Sure:@"登录"
                 preferredStyle:UIAlertControllerStyleAlert
                         SureAC:^{
                             [[TabBarTool Share_TabBarTool]CreateLoginC:V];
                         } NoAC:^{
                             
                         } ViewController:V];
    }else {
        if (Close) {
            Close();
        }
    }
}


- (void)CreateLoginC:(TT_BaseC *)C {
    LoginC *LC = [[LoginC alloc]init];
    [C.navigationController pushViewController:LC animated:YES];
    
}

- (void)CreateTabBar {
   
    JMConfig *config = [JMConfig config];
    config.imageSize = CGSizeMake(24, 24);
    config.imageOffset = 7;
    config.norTitleColor = Col_999;
    config.selTitleColor = Col_228;
    config.typeLayout = JMConfigTypeLayoutNormal;
    
    config.tabBarAnimType = JMConfigTabBarAnimTypeRotationY;
    NSMutableArray *titleArr = [NSMutableArray arrayWithObjects:@"首页",@"消息",@"探索",@"个人中心", nil];
    NSMutableArray *imageNormalArr = [NSMutableArray arrayWithObjects:@"shouye2",@"xiaoxi2",@"tansuo2",@"wode2", nil];
    NSMutableArray *imageSelectedArr = [NSMutableArray arrayWithObjects:@"shouye1",@"xiaoxi1",@"tansuo1",@"wode1", nil];
    NSMutableArray *controllersArr = [NSMutableArray array];
    
    HomeC *firstViewController = [[HomeC alloc] init];
    UIViewController *firstNavigationController = [[TT_BaseNavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    XiaoxiC *xc = [[XiaoxiC alloc]init];
    UIViewController *sec = [[TT_BaseNavigationController alloc]initWithRootViewController:xc];
    
    Tansuo *ts = [[Tansuo alloc]init];
    UIViewController *tss = [[TT_BaseNavigationController alloc]initWithRootViewController:ts];
    
    MyC *fivethViewController = [[MyC alloc]init];
    UIViewController *fivethNavigationController = [[TT_BaseNavigationController alloc]
                                                    initWithRootViewController:fivethViewController];
    
    [controllersArr addObject:firstNavigationController];
    [controllersArr addObject:sec];
    [controllersArr addObject:tss];
    [controllersArr addObject:fivethNavigationController];
    
    JMTabBarController *tabBar = [[JMTabBarController alloc]initWithTabBarControllers:controllersArr NorImageArr:imageNormalArr SelImageArr:imageSelectedArr TitleArr:titleArr Config:config];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIView *shadowView = [[UIView alloc]initWithFrame:CGRectMake((KScreenWidth / 5) / 2 - 25, -10, 50, 50)];
    
    shadowView.layer.shadowColor = [UIColor getColor:@"#7c7b7b"].CGColor;
    shadowView.layer.shadowOffset = CGSizeMake(0, -6);
    shadowView.layer.shadowOpacity = .17;
    shadowView.layer.cornerRadius = 25;
    [shadowView addSubview:self.ZTBF];
    [btn addSubview:shadowView];
    [self.ZTBF.layer addSublayer:self.CenterLayer];
    [config addCustomBtn:btn AtIndex:2 BtnClickBlock:^(UIButton *btn, NSInteger index) {

    }];
    AppDelegate* appDelagete = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelagete.window.rootViewController = tabBar;
}


- (CALayer *)CenterLayer {
    if (!_CenterLayer) {
        _CenterLayer = [TT_ControlTool FTT_ControlToolCALayerFrame:CGRectMake(4,4, 42, 42) AndImageName:@"fabu" AndBackgtoundColor:nil BorderColor:nil BorderWidth:0 masksToBounds:YES corerRadius:21];
    }
    return _CenterLayer;
}

- (UIView *)ZTBF{
    if (!_ZTBF) {
        _ZTBF = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        _ZTBF.backgroundColor = [UIColor getColor:@"#FFFFFF"];
        _ZTBF.layer.masksToBounds = YES;
        _ZTBF.layer.cornerRadius = 25;
        _ZTBF.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap_close)];
        [_ZTBF addGestureRecognizer:tap];
    }
    return _ZTBF;
}


- (void)tap_close {
  
    if (self.ViewtapClose) {
        self.ViewtapClose(0, @"");
    }
}

@end
