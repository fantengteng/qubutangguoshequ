//
//  MySetupC.m
//  磁力云打印
//
//  Created by linlin dang on 2019/4/19.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MySetupC.h"

@interface MySetupC ()
@property (nonatomic , strong) HomeVM *VM;
@end

@implementation MySetupC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Is_hideJuhuazhuan = NO;
    self.title = @"设置";
    [self setupVM:[HomeVM class]];
    [self configData];
 
}

- (void)configData {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@"service_protocol" forKey:@"type"];
    [self configDataforNewnetWorkname:docdetailMARK params:dic networkClass:[HomeAPI class]];
}
- (IBAction)loginout:(id)sender {
    Eliminate(@"token")
    Eliminate(@"userId")
    [[TabBarTool Share_TabBarTool]CreateLoginC:self];
}

- (IBAction)fuwuxieyi:(id)sender {
    [self jumpDetailC:@"https://zzyuanshun.cn/smart-api/doc/detail?deviceType=2&version=1.0.0&appCode=bbs5&type=privacy"];
}

- (void)jumpDetailC:(NSString *)url{
    CurrenC *CC = [[CurrenC alloc]init];
    CC.web_url = url;
    [self JumpController:CC];
}


- (IBAction)qinglihuancun:(id)sender {
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"正在清理缓存>>>"
                                      AndView:self.view
                                      AndMode:MBProgressHUDModeIndeterminate
                                     AndImage:@"POOOO"
                                AndAfterDelay:3
                                      AndBack:^{
                                          [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"清理成功"
                                                                            AndView:self.view           AndMode:MBProgressHUDModeText
                                                                           AndImage:@"NONO"
                                                                      AndAfterDelay:1
                                                                            AndBack:nil];
                                      }];
}

@end
