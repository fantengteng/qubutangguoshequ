//
//  Homedianzan.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "Homedianzan.h"

@interface Homedianzan ()

@property (nonatomic , strong) YYLabel *message_LAB;
@property (nonatomic , strong) UIButton *dianzan;
@end
@implementation Homedianzan

#pragma mark 生命周期

#pragma mark 回调协议

#pragma mark 触发方法

- (void)tap_btn:(UIButton *)btn {
    btn.selected = !btn.selected;
    [self configdianzanState:btn.selected];
    if (self.ViewtapClose) {
        self.ViewtapClose(1, @"");
    }
}

#pragma mark 公开方法

- (void)configdianzanstr:(NSString *)dianzan pinglunstr:(NSString *)pinglunStr isDianzan:(BOOL)isDianzan {
    self.message_LAB.text = [NSString stringWithFormat:@"评论%@·赞%@",pinglunStr,dianzan];
    [self configdianzanState:isDianzan];
}

#pragma mark 私有方法

- (void)tt_setupViews {
    [self addSubview:self.message_LAB];
    [self addSubview:self.dianzan];
    [self tt_setupViewsFrame];
}

- (void)tt_setupViewsFrame {
    self.message_LAB.sd_layout
    .leftSpaceToView(self, 15)
    .topEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(150);
    
    self.dianzan.sd_layout
    .rightSpaceToView(self, 15)
    .topEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(35);
}

- (void)configdianzanState:(BOOL)YorN {
    NSString *ImageStr = @"dazan1";
    if (YorN) {
        ImageStr = @"dazan2";
    }
    [self.dianzan setImage:[UIImage imageNamed:ImageStr] forState:UIControlStateNormal];
}

#pragma mark 存取方法


- (UIButton *)dianzan {
    if (!_dianzan) {
        _dianzan = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectZero
                                                         taeget:self
                                                            sel:@selector(tap_btn:)
                                                            tag:0
                                                       AntTitle:nil
                                                      titleFont:0
                                                     titleColor:nil
                                                       andImage:@"dazan1"
                                                   AndBackColor:nil
                                        adjustsFontSizesTowidth:NO
                                                  masksToBounds:NO
                                                   conrenRadius:0
                                                    BorderColor:nil
                                                    BorderWidth:0
                                      ContentHorizontalAligment:0];
    }
    return _dianzan;
}

- (YYLabel *)message_LAB {
    if (!_message_LAB) {
        _message_LAB = [Create_Tool CreatLabeltextcolor:Col_666 textfont:[UIFont systemFontOfSize:12]];
    }
    return _message_LAB;
}

@end
