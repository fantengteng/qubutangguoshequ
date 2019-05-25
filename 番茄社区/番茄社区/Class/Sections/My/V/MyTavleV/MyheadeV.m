//
//  MyheadeV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyheadeV.h"


@interface MyheadeV ()

@property (nonatomic , strong) UIImageView *header;

@property (nonatomic , strong) UILabel *title;

@property (nonatomic , strong) UIButton *btn;

@property (nonatomic , assign) NSInteger type;
@end

@implementation MyheadeV


- (void)tap_btn {
    if (self.ViewtapClose) {
        self.ViewtapClose(self.type, @"");
    }
}

- (void)configImageStr:(NSString *)ImageStr name:(NSString *)name {
    if (![ImageStr isEqualToString:@""]) {
        self.type = 1;
        [self.btn removeFromSuperview];
        [self addSubview:self.btn];
        [self addSubview:self.header];
        [self addSubview:self.title];
        self.title.text = name;
        self.header.layer.cornerRadius = 31;
        self.header.layer.masksToBounds = YES;
        [self.header setImageWithURL:[NSURL URLWithString:ImageStr]
                 placeholder:[UIImage imageNamed:@"NONONO"]
                     options:YYWebImageOptionProgressive
                     manager:[Create_Tool ImageManager]
                    progress:nil
                   transform:nil
                  completion:nil];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap_btn)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:tap];
    }else {

        [self.header removeFromSuperview];
        [self.title removeFromSuperview];
        self.type = 2;
        self.btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(KScreenWidth / 2 - 50, 110, 100, 44)
                                                              taeget:self
                                                                 sel:@selector(tap_btn)
                                                                 tag:0
                                                            AntTitle:@"请登录"
                                                           titleFont:14
                                                          titleColor:Col_FFF
                                                            andImage:@"NONONO"
                                                        AndBackColor:nil
                                             adjustsFontSizesTowidth:NO
                                                       masksToBounds:NO
                                                        conrenRadius:4
                                                         BorderColor:Col_FFF
                                                         BorderWidth:1
                                           ContentHorizontalAligment:0];
        [self addSubview:self.btn];
    }
}
- (void)tt_setupViews {
    self.backgroundColor = Col_228;
    self.header = [TT_ControlTool FTT_ControlToolUIImageViewFrame:CGRectMake(KScreenWidth / 2 - 31, 110, 62, 62)
                                                                ImageName:@"MOMO"
                                           userInteractionEnabled:NO
                                                    MasksToBounds:YES
                                                    ConrenrRadius:31
                                                      BorderColor:Col_FFF
                                                      BorderWidth:0
                                                       LabelBlock:nil];
    
    self.title = [TT_ControlTool FTT_ControlToolUILabelFrame:CGRectMake(0, CGRectGetMaxY(self.header.frame) + 5, KScreenWidth, 20)
                                                    AndTitle:@"昵称"
                                                 AndFontSize:15
                                               AndTitleColor:Col_FFF
                                               Numberoflines:0
                                               TextAlignment:NSTextAlignmentCenter
                                    adjustesFontSizesTowidth:NO
                                               masksToBounds:NO
                                               conrenrRadius:0
                                      userInteractionEnabled:NO
                                                  LabelBlock:nil
                                                  lineIsShow:NO
                                                   lineFrame:CGRectZero];
   
}

@end
