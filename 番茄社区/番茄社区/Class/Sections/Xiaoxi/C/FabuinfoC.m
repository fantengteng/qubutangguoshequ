//
//  FabuinfoC.m
//  捕鱼达人
//
//  Created by linlin dang on 2019/4/1.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "FabuinfoC.h"
#import "TT_TextView.h"
#import "PhotoCollectionViewCell.h"
#import "TT_CollectionIMGV.h"
@interface FabuinfoC ()
@property (nonatomic , strong) TT_TextView *TextV;
@property (nonatomic , strong) TT_CollectionIMGV *IMGV;
@property (nonatomic , strong) UIButton *SureBtn;
@property (nonatomic , strong) HomeVM *VM;
@end

@implementation FabuinfoC


#pragma mark 生命周期


- (void)viewDidLoad {
    [super viewDidLoad];
    [self tt_changeDefauleConfiguration];
}


#pragma mark 回调协议


#pragma mark 界面跳转

#pragma mark 触发方法

- (void)sure {
    if ([self.TextV.text isEqualToString:self.TextV.tt_placeholder] || self.TextV.text.length == 0) {
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"发布内容不能为空" AndView:self.view AndMode:MBProgressHUDModeText AndImage:nil AndAfterDelay:1 AndBack:nil];
    }else {
        [[FTT_HudTool share_FTT_HudTool]CreateMBProgressHUDModeIndeterminateForVeiw:self.view];
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:@(self.cat_id) forKey:@"categoryId"];
        [dic setValue:self.TextV.text forKey:@"content"];
        for (int i = 0 ; i < self.IMGV.selectedPhotos.count; i++) {
            [dic setValue:self.IMGV.selectedPhotos[i] forKey:[NSString stringWithFormat:@"%d",i]];
        }
        [self configDataforNewnetWorkname:blogsubmitBlogMARK params:dic networkClass:[HomeAPI class]];
    }
    
}

#pragma mark 公开方法

- (void)tt_addSubviews {
    self.view.backgroundColor = Col_F6F;
    [self.view addSubview:self.TextV];
    [self.view addSubview:self.IMGV];
    [self.view addSubview:self.SureBtn];
    [self setupVM:[HomeVM class]];
    [self tt_allClose];
}

- (void)tt_allClose {
    @weakify(self)
    self.IMGV.ChangeFrame = ^(CGFloat H) {
        @strongify(self)
        self.IMGV.frame = CGRectMake(5, CGRectGetMaxY(self.TextV.frame) + 5,  KScreenWidth - 10, H);
        self.SureBtn.frame = CGRectMake(15, CGRectGetMaxY(self.IMGV.frame) + 45, KScreenWidth - 30, 44);
    };
}

- (void)tt_changeDefauleConfiguration {
    self.title = @"发布";
    self.Is_hideJuhuazhuan = NO;
    self.IMGV.maxCount = 3;
}

- (void)configSuccessTankuang:(NSString *)mark {
    if ([mark isEqualToString:blogsubmitBlogMARK]) {
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"发布成功" AndView:self.view AndMode:MBProgressHUDModeText AndImage:@"NONO" AndAfterDelay:1 AndBack:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
    }
}

#pragma mark 私有方法

#pragma mark 存取方法

- (TT_TextView *)TextV {
    if (!_TextV) {
        IPhoneXHeigh
        _TextV = [[TT_TextView alloc]initWithFrame:CGRectMake(15, securitytop_Y  +15, KScreenWidth - 30, 190)];
        _TextV.backgroundColor = Col_FFF;
        _TextV.tt_placeholder = @"请输入要发布的内容...";
    }
    return _TextV;
}

- (TT_CollectionIMGV *)IMGV {
    if (!_IMGV) {
        _IMGV = [[TT_CollectionIMGV alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.TextV.frame) + 5,  KScreenWidth - 10, (KScreenWidth - 30 - 20 ) / 3  + 10 )];
        _IMGV.VC = self;
    }
    return _IMGV;
}

- (UIButton *)SureBtn {
    if (!_SureBtn) {
        _SureBtn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(15, CGRectGetMaxY(self.IMGV.frame) + 45, KScreenWidth - 30, 44)
                                                         taeget:self
                                                            sel:@selector(sure)
                                                            tag:0
                                                       AntTitle:@"发布"
                                                      titleFont:16
                                                     titleColor:Col_FFF
                                                       andImage:nil
                                                   AndBackColor:Col_228
                                        adjustsFontSizesTowidth:NO
                                                  masksToBounds:YES
                                                   conrenRadius:2
                                                    BorderColor:nil
                                                    BorderWidth:0
                                      ContentHorizontalAligment:0];
    }
    return _SureBtn;
}
@end
