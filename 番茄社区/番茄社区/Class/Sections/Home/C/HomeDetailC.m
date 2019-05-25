//
//  HomeDetailC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeDetailC.h"
#import "HomeDetailTableV.h"
#import "HomecellinfoModel.h"
#import "TT_TextV.h"
@interface HomeDetailC ()<TT_TextVDelegate>
@property (nonatomic , strong) HomeDetailTableV *TableV;
@property (nonatomic , strong) HomeVM *VM;
@property (nonatomic , strong) TT_TextV *textV;
@property (nonatomic , strong) UIButton *btn;
@property (nonatomic , strong) NSMutableArray *data;
@end

@implementation HomeDetailC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Col_FFF;
    [self configData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.textV TextViewDeleate];
}

#pragma mark 回调协议


- (void)TT_TextVtapSendTriggereventWithtext:(NSString *)text {
    if (text.length == 0 || [text isEqualToString:self.textV.placeholdstr]) {
        [[FTT_HudTool share_FTT_HudTool] CreateHUD:@"请输入内容" AndView:self.view AndMode:MBProgressHUDModeCustomView AndImage:@"cuo" AndAfterDelay:1 AndBack:nil];
    }else {
        [self submitComment:text];
    }
}

- (void)tt_allClose {
    @weakify(self)
    self.TableV.tapClose = ^(NSInteger num, id data) {
        @strongify(self)
        [[TabBarTool Share_TabBarTool]configisLoginv:self];
        [self configchuafafangfa:num];
    };
}

#pragma mark 界面跳转

#pragma mark 触发方法

- (void)Tap_btn {
    [[TabBarTool Share_TabBarTool]configisLoginv:self];
    self.textV.placeholdstr = @"赞美两句呗";
    [self.textV Keyboardbounceshow];
}

- (void)submitComment:(NSString *)text{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(self.model.blogId) forKey:@"blogId"];
    [dic setValue:text forKey:@"content"];
    [self configDataforNewnetWorkname:blogsubmitCommentMARK
                               params:dic
                         networkClass:[HomeAPI class]];
}

- (void)configchuafafangfa:(NSInteger)num {
    [[FTT_HudTool share_FTT_HudTool]CreateMBProgressHUDModeIndeterminateForVeiw:self.view];
    NSMutableDictionary *dic = [NSMutableDictionary new];
    if (num == 0) {
        [dic setValue:self.model.publisher[@"userCode"] forKey:@"relatedUserCode"];
        [dic setValue:[NSString stringWithFormat:@"%ld", (long)self.model.followed] forKey:@"operateType"];
        [self configDataforNewnetWorkname:followUserMark params:dic networkClass:[HomeAPI class]];
    }else if (num == 1) {
        [dic setValue:@(self.model.blogId) forKey:@"blogId"];
        [dic setValue:@(self.model.upCnt) forKey:@"operateType"];
        [self configDataforNewnetWorkname:bloglikeMARK params:dic networkClass:[HomeAPI class]];
    }
}

#pragma mark 公开方法

- (void)tt_addSubviews {
    IPhoneXHeigh
    [self setupTableV:[HomeDetailTableV class] Frame:CGRectMake(0, securitytop_Y, KScreenWidth, security_H - 50)];
    [self setupVM:[HomeVM class]];
    [self.view addSubview:self.btn];
    [self tt_allClose];
}

- (id)changeData:(id)Data mark:(NSString *)mark {
    if ([mark isEqualToString:bloglistBlogCommentMARK]) {
        if (self.TableV.Page == 0) {
            NSMutableArray *data = [NSMutableArray new];
            [data addObject:self.model];
            [data addObjectsFromArray:(NSArray *)Data];
            return data;
        }else {
            return Data;
        }
    }
    return Data;
}

- (void)configData {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(self.model.blogId) forKey:@"blogId"];
    [dic setValue:@(self.TableV.Page) forKey:@"page"];
    [self configDataforNewnetWorkname:bloglistBlogCommentMARK
                               params:dic
                         networkClass:[HomeAPI class]];
}

- (void)configSuccessTankuang:(NSString *)mark {
    [[FTT_HudTool share_FTT_HudTool]dissmiss];
    if ([mark isEqualToString:blogsubmitCommentMARK]) {
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"提交成功" AndView:self.view
                                          AndMode:MBProgressHUDModeText
                                         AndImage:@"NNOO"
                                    AndAfterDelay:1
                                          AndBack:nil];
    }else if ([mark isEqualToString:followUserMark]) {
        NSString *str ;
        if (self.model.followed == 1) {
            self.model.followed = 0;
            str = @"取消关注";
        }else {
            self.model.followed = 1;
            str = @"关注成功";
        }
        [self.TableV reloadData];
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:str AndView:self.view
                                          AndMode:MBProgressHUDModeText
                                         AndImage:@"NNOO"
                                    AndAfterDelay:1
                                          AndBack:nil];
    }
    
}
#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.title = @"详情";
    [self wr_setNavBarShadowImageHidden:NO];
}


#pragma mark 存取方法

- (UIButton *)btn {
    if (!_btn) {
        _btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(15, CGRectGetMaxY(self.TableV.frame) + 9, KScreenWidth - 30,32)
                                                     taeget:self
                                                        sel:@selector(Tap_btn)
                                                        tag:0
                                                   AntTitle:@"   赞美两句呗"
                                                  titleFont:13
                                                 titleColor:Col_999
                                                   andImage:nil
                                               AndBackColor:Col_ECE
                                    adjustsFontSizesTowidth:NO
                                              masksToBounds:YES
                                               conrenRadius:16
                                                BorderColor:nil
                                                BorderWidth:0
                                  ContentHorizontalAligment:1];
    }
    return _btn;
}

- (TT_TextV *)textV {
    if (!_textV) {
        _textV = [[TT_TextV alloc]init];
        _textV.TT_deldgate = self;
    }
    return _textV;
}

@end
