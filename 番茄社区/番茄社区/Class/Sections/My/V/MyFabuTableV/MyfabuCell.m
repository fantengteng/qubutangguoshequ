//
//  MyfabuCell.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/27.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyfabuCell.h"
#import "CurreryImagSV.h"
@interface MyfabuCell ()

@property (nonatomic , strong) YYLabel *time_lab;

@property (nonatomic , strong) UIButton *delet_btn;

@property (nonatomic , strong) YYLabel *message_LAB;

@property (nonatomic , strong) CurreryImagSV *ImagesV;

@property (nonatomic , strong) UIView *line;

@property (nonatomic , strong) UIView *BG;

@end


@implementation MyfabuCell



#pragma mark 生命周期
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

#pragma mark 回调协议

#pragma mark 触发方法

- (void)delet_method {
    if (self.currencyClose) {
        self.currencyClose(0);
    }
}

- (void)tap:(UIButton *)btn {
    
}
#pragma mark 公开方法

- (void)configData:(HomecellinfoModel *)Data {
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:Data.content];
    content.lineSpacing = 5;
    content.color       = Col_666;
    content.font        = [UIFont systemFontOfSize:12];
    self.message_LAB.attributedText = content;
    CGSize maxsize = CGSizeMake(KScreenWidth - 30, MAXFLOAT);
    YYTextLayout *layout1 = [YYTextLayout layoutWithContainerSize:maxsize text:content];
    self.message_LAB.sd_layout
    .heightIs(layout1.textBoundingSize.height);
    self.message_LAB.attributedText = content;
    
    NSMutableAttributedString *TimeSTr = [[NSMutableAttributedString alloc]initWithString:Data.publishTime];
    TimeSTr.font = [UIFont systemFontOfSize:11];
    TimeSTr.color = Col_999;
    
    NSString *STR = @"   审核中";
    if (Data.auditStatus == 1) {
        STR = @"";
    }
    NSMutableAttributedString *SH = [[NSMutableAttributedString alloc]initWithString:STR];
    SH.font = [UIFont systemFontOfSize:11];
    SH.color = Col_228;
    
    [TimeSTr appendAttributedString:SH];
    self.time_lab.attributedText = TimeSTr;
    
    
    
    if (content) {
        NSMutableArray *IMS = [NSMutableArray new];
        for (NSDictionary *dic  in Data.imgList) {
            [IMS addObject:dic[@"thumbnail"]];
        }
        [self.ImagesV configImageS:IMS type:1];
    }
    
    self.ImagesV.sd_layout
    .topSpaceToView(self.message_LAB, 0)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(self.ImagesV.H);
    
    self.line.sd_layout
    .topSpaceToView(self.ImagesV, 0)
    .leftSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(1);
    [self creatBtn];
    self.BG.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .topSpaceToView(self.line, 57)
    .heightIs(10);
    
    
    [self setupAutoHeightWithBottomView:self.BG bottomMargin:1];
}

#pragma mark 私有方法

- (void)setupSubviewS {
    [self.contentView addSubview:self.time_lab];
    [self.contentView addSubview:self.delet_btn];
    [self.contentView addSubview:self.message_LAB];
    [self.contentView addSubview:self.ImagesV];
    [self.contentView addSubview:self.line];
    [self.contentView addSubview:self.BG];
    [self setupSubViewsFrame];
}

- (void)setupSubViewsFrame {
    
    self.delet_btn.sd_layout
    .rightSpaceToView(self.contentView, 0)
    .topSpaceToView(self.contentView, 0)
    .widthIs(50)
    .heightIs(50);
    
    self.time_lab.sd_layout
    .rightSpaceToView(self.delet_btn, 0)
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.contentView, 0)
    .heightIs(50);
    
    self.message_LAB.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .topSpaceToView(self.time_lab, 0);
    
}

- (void)creatBtn {
    NSArray *arr = @[[NSString stringWithFormat:@"  %ld",(long)self.model.praised],[NSString stringWithFormat:@"  %ld",self.model.commentCnt]];
    NSArray *Arr = @[@"dazan1",@"pinglun"];
    UIButton *btn = [self viewWithTag:1];
    if (!btn) {
        for (int i = 0; i < 2; i++) {
            UIButton *btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectZero
                                                                  taeget:self
                                                                     sel:@selector(tap:)
                                                                     tag:i + 1
                                                                AntTitle:arr[i]
                                                               titleFont:13
                                                              titleColor:Col_666
                                                                andImage:Arr[i]
                                                            AndBackColor:nil
                                                 adjustsFontSizesTowidth:NO
                                                           masksToBounds:NO
                                                            conrenRadius:0
                                                             BorderColor:nil
                                                             BorderWidth:0
                                               ContentHorizontalAligment:0];
            [self.contentView addSubview:btn];
            
            btn.sd_layout
            .leftSpaceToView(self.contentView, (KScreenWidth / 2) * i)
            .topSpaceToView(self.line, 10)
            .widthIs((KScreenWidth / 2))
            .heightIs(36);
        }
    }
  
    
}



#pragma mark 存取方法

- (void)setModel:(HomecellinfoModel *)model {
    _model = model;
    [self configData:model];
}

- (YYLabel *)time_lab {
    if (!_time_lab) {
        _time_lab = [Create_Tool CreatLabeltextcolor:Col_999 textfont:[UIFont systemFontOfSize:11]];
    }
    return _time_lab;
}

- (UIButton *)delet_btn {
    if (!_delet_btn) {
        _delet_btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectZero
                                                           taeget:self
                                                              sel:@selector(delet_method)
                                                              tag:0
                                                         AntTitle:nil
                                                        titleFont:0
                                                       titleColor:nil
                                                         andImage:@"sanchu"
                                                     AndBackColor:nil
                                          adjustsFontSizesTowidth:NO
                                                    masksToBounds:NO
                                                     conrenRadius:0
                                                      BorderColor:nil
                                                      BorderWidth:0
                                        ContentHorizontalAligment:0];
    }
    return _delet_btn;
}

- (YYLabel *)message_LAB {
    if (!_message_LAB) {
        _message_LAB = [Create_Tool CreatLabeltextcolor:Col_666 textfont:[UIFont systemFontOfSize:12]];
    }
    return _message_LAB;
}

- (CurreryImagSV *)ImagesV {
    if (!_ImagesV) {
        _ImagesV = [[CurreryImagSV alloc]init];
    }
    return _ImagesV;
}

- (UIView *)line {
    if (!_line) {
        _line = [TT_ControlTool FTT_ControlToolUIViewFrame:CGRectZero
                                           BackgroundColor:Col_ECE
                                             MasksToBounds:NO
                                             ConrenrRadius:0];
    }
    return _line;
}

- (UIView *)BG {
    if (!_BG) {
        _BG = [[UIView alloc]init];
        _BG.backgroundColor = Col_ECE;
    }
    return _BG;
}


@end
