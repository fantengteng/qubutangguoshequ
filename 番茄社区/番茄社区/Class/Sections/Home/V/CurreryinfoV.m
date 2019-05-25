//
//  CurreryinfoV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "CurreryinfoV.h"

@interface CurreryinfoV()

@end

@implementation CurreryinfoV



#pragma mark 生命周期

#pragma mark 回调协议

#pragma mark 触发方法

- (void)tap_collect {
    if (self.ViewtapClose) {
        self.ViewtapClose(0, @"");
    }
}

#pragma mark 公开方法

- (void)configheaderImageName:(NSString *)ImageName nameStr:(NSString *)nameStr timeStr:(NSString *)timeStr {
    if (ImageName) {
        [self.HeaderIMG setImageWithURL:[NSURL URLWithString:ImageName] placeholder:[UIImage imageNamed:@"NONONO"] options:YYWebImageOptionProgressive manager:[Create_Tool ImageManager] progress:nil transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
             return [image imageWithRadius:22.5 rectSize:CGSizeMake(45, 45)];
        }  completion:nil];
    }
    
    if (nameStr) {
        self.Name_LAB.text = nameStr;
    }
    
    if (timeStr) {
        self.Time_LAB.text = timeStr;
    }
}

- (void)configCollec_btnStr:(NSString *)Str imageStr:(NSString *)imageStr {
    if (Str) {
        [self.collect_btn setTitle:Str forState:UIControlStateNormal];
        [self.collect_btn setTitleColor:Col_228 forState:UIControlStateNormal];
    }
    
}

#pragma mark 私有方法

- (void)tt_setupViews {
    [self addSubview:self.HeaderIMG];
    [self addSubview:self.Name_LAB];
    [self addSubview:self.Time_LAB];
    [self addSubview:self.collect_btn];
    [self tt_setupViewsFrame];
}

- (void)tt_setupViewsFrame {
    self.HeaderIMG.sd_layout
    .leftSpaceToView(self, 15)
    .topSpaceToView(self, 0)
    .widthIs(45)
    .heightIs(45);
    
    CALayer *avatarBorder = [CALayer layer];
    avatarBorder.frame = self.HeaderIMG.bounds;
    avatarBorder.borderWidth = CGFloatFromPixel(1);
    avatarBorder.borderColor = [UIColor colorWithWhite:0.000 alpha:0.090].CGColor;
    avatarBorder.cornerRadius = self.HeaderIMG.height / 2;
    avatarBorder.shouldRasterize = YES;
    avatarBorder.rasterizationScale = kScreenScale;
    [self.HeaderIMG.layer addSublayer:avatarBorder];
    
    self.Name_LAB.sd_layout
    .leftSpaceToView(self.HeaderIMG, 13)
    .rightSpaceToView(self, 80)
    .topSpaceToView(self, 4)
    .heightIs(22);
    
    self.Time_LAB.sd_layout
    .leftEqualToView(self.Name_LAB)
    .topSpaceToView(self.Name_LAB, 0)
    .rightEqualToView(self.Name_LAB)
    .heightIs(17);
    
    self.collect_btn.sd_layout
    .rightSpaceToView(self, 15)
    .centerYEqualToView(self)
    .widthIs(60)
    .heightIs(28);
}

#pragma mark 存取方法


- (UIImageView *)HeaderIMG {
    if (!_HeaderIMG) {
        _HeaderIMG = [[UIImageView alloc]init];
        _HeaderIMG.size = CGSizeMake(45, 45);
        [_HeaderIMG.image imageWithRadius:22.5 rectSize:CGSizeMake(45, 45)];
    }
    return _HeaderIMG;
}


- (YYLabel *)Name_LAB {
    if (!_Name_LAB) {
        _Name_LAB = [Create_Tool CreatLabeltextcolor:Col_333 textfont:[UIFont boldSystemFontOfSize:16]];
    }
    return _Name_LAB;
}

- (YYLabel *)Time_LAB {
    if (!_Time_LAB) {
        _Time_LAB = [Create_Tool CreatLabeltextcolor:Col_999 textfont:[UIFont systemFontOfSize:12]];
    }
    return _Time_LAB;
}


- (UIButton *)collect_btn {
    if (!_collect_btn) {

           
        
        _collect_btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectZero
                                                             taeget:self
                                                                sel:@selector(tap_collect)
                                                                tag:0
                                                           AntTitle:@"关注"
                                                          titleFont:10
                                                         titleColor:Col_228
                                                           andImage:@"NONONO"
                                                       AndBackColor:nil
                                            adjustsFontSizesTowidth:NO
                                                      masksToBounds:YES
                                                       conrenRadius:5
                                                        BorderColor:Col_228
                                                        BorderWidth:1
                                          ContentHorizontalAligment:0];
    }
    return _collect_btn;
}


@end
