//
//  HomeCatV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeCatV.h"

@implementation HomeCatV


#pragma mark 生命周期

#pragma mark 回调协议

#pragma mark 触发方法

- (void)tap_btn:(UIButton *)btn {
    if (self.ViewtapClose) {
        self.ViewtapClose(btn.tag, @"");
    }
}

#pragma mark 公开方法


- (void)tt_setupViews {
    self.backgroundColor = Col_FFF;
    
    UIButton *cat = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(8, 8, (KScreenWidth - 24) / 2, (KScreenWidth - 24) / 2  * 0.56)
                                                          taeget:self
                                                             sel:@selector(tap_btn:)
                                                             tag:1000
                                                        AntTitle:nil
                                                       titleFont:0
                                                      titleColor:nil
                                                        andImage:@"quanbufenlei"
                                                    AndBackColor:nil
                                         adjustsFontSizesTowidth:NO
                                                   masksToBounds:NO
                                                    conrenRadius:0
                                                     BorderColor:nil
                                                     BorderWidth:0
                                       ContentHorizontalAligment:0];
    
    
    UIButton *cat1 = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(CGRectGetMaxX(cat.frame) + 8, 8, (KScreenWidth - 24) / 2, (KScreenWidth - 24) / 2  * 0.56)
                                                          taeget:self
                                                             sel:@selector(tap_btn:)
                                                             tag:1004
                                                        AntTitle:nil
                                                       titleFont:0
                                                      titleColor:nil
                                                        andImage:@"meitu"
                                                    AndBackColor:nil
                                         adjustsFontSizesTowidth:NO
                                                   masksToBounds:NO
                                                    conrenRadius:0
                                                     BorderColor:nil
                                                     BorderWidth:0
                                       ContentHorizontalAligment:0];
    
    
    UIButton *cat2 = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(8, CGRectGetMaxY(cat1.frame) + 8 , (KScreenWidth - 32) / 3, (KScreenWidth - 32) / 3)
                                                          taeget:self
                                                             sel:@selector(tap_btn:)
                                                             tag:1005
                                                        AntTitle:nil
                                                       titleFont:0
                                                      titleColor:nil
                                                        andImage:@"paizhao"
                                                    AndBackColor:nil
                                         adjustsFontSizesTowidth:NO
                                                   masksToBounds:NO
                                                    conrenRadius:0
                                                     BorderColor:nil
                                                     BorderWidth:0
                                       ContentHorizontalAligment:0];
    
    UIButton *cat3 = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(CGRectGetMaxX(cat2.frame)+ 8, CGRectGetMaxY(cat1.frame) + 8, (KScreenWidth - 32) / 3, (KScreenWidth - 32) / 3)
                                                          taeget:self
                                                             sel:@selector(tap_btn:)
                                                             tag:1006
                                                        AntTitle:nil
                                                       titleFont:0
                                                      titleColor:nil
                                                        andImage:@"youxi"
                                                    AndBackColor:nil
                                         adjustsFontSizesTowidth:NO
                                                   masksToBounds:NO
                                                    conrenRadius:0
                                                     BorderColor:nil
                                                     BorderWidth:0
                                       ContentHorizontalAligment:0];
    
    UIButton *cat4 = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(CGRectGetMaxX(cat3.frame)+ 8, CGRectGetMaxY(cat1.frame) + 8, (KScreenWidth - 32) / 3, (KScreenWidth - 32) / 3)
                                                          taeget:self
                                                             sel:@selector(tap_btn:)
                                                             tag:1007
                                                        AntTitle:nil
                                                       titleFont:0
                                                      titleColor:nil
                                                        andImage:@"gaoxiao"
                                                    AndBackColor:nil
                                         adjustsFontSizesTowidth:NO
                                                   masksToBounds:NO
                                                    conrenRadius:0
                                                     BorderColor:nil
                                                     BorderWidth:0
                                       ContentHorizontalAligment:0];
    [self addSubview:cat];
    [self addSubview:cat1];
    [self addSubview:cat2];
    [self addSubview:cat3];
    [self addSubview:cat4];
    
    
    
}

#pragma mark 私有方法

#pragma mark 存取方法





@end
