//
//  HomeTableCell.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeTableCell.h"
#import "CurreryinfoV.h"
#import "CurreryImagSV.h"
@interface HomeTableCell ()

@property (nonatomic , strong) UIView *BG;

@property (nonatomic , strong) CurreryinfoV *headerInfo;

@property (nonatomic , strong) CurreryImagSV *ImagesV;

@property (nonatomic , strong) YYLabel *message_LAB;

@property (nonatomic , strong) UIView *line;
@end

@implementation HomeTableCell



#pragma mark 生命周期

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark 回调协议


#pragma mark 触发方法

- (void)tap:(UIButton *)btn {
    if (self.currencyClose) {
        self.currencyClose(btn.tag);
    }
}

#pragma mark 公开方法

- (void)configData:(HomecellinfoModel *)Data {
    [self.headerInfo configheaderImageName:Data.publisher[@"avatar"] nameStr:Data.publisher[@"nickName"] timeStr:Data.publishTime];
    NSString *name ,*IMgstr;
    if (Data.followed == 0) {
        IMgstr = @"guanzhu";
        name = @"关注";
    }else {
        IMgstr = @"";
        name = @"取消关注";
    }
    [self.headerInfo configCollec_btnStr:name imageStr:IMgstr];
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

//    if (!self.ImagesV.H) {
        NSMutableArray *IMS = [NSMutableArray new];
        for (NSDictionary *dic  in Data.imgList) {
            [IMS addObject:dic[@"thumbnail"]];
        }
        [self.ImagesV configImageS:IMS type:1];
//    }
    
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
    UIButton *btn = [self viewWithTag:1];
    if (!btn) {
         [self creatBtn];
    }else {
        NSString *ImageStr = @"dazan1";
        if (self.model.upCnt == 1) {
            ImageStr = @"dazan2";
        }
        [btn setImage:[UIImage imageNamed:ImageStr] forState:UIControlStateNormal];
        [btn setTitle:[NSString stringWithFormat:@"  %ld",(long)Data.praised] forState:UIControlStateNormal];
        
    }
    [self setupAutoHeightWithBottomView:self.line bottomMargin:57];
    
    @weakify(self)
    self.headerInfo.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (self.currencyClose) {
            self.currencyClose(num);
        }
    };
}

- (void)creatBtn {
    NSArray *arr = @[[NSString stringWithFormat:@"  %ld",(long)self.model.praised],[NSString stringWithFormat:@"  %ld",(long)self.model.commentCnt],@"  屏蔽"];
    NSString *ImageStr = @"dazan1";
    if (self.model.upCnt == 1) {
        ImageStr = @"dazan2";
    }
    NSArray *Arr = @[ImageStr,@"pinglun",@"pingbi1"];
    for (int i = 0; i < 3; i++) {
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
        .leftSpaceToView(self.contentView, (KScreenWidth / 3) * i)
        .topSpaceToView(self.line, 10)
        .widthIs((KScreenWidth / 3))
        .heightIs(36);
    }
    
}

#pragma mark 私有方法

- (void)setupSubviewS {
    [self.contentView addSubview:self.BG];
    [self.contentView addSubview:self.headerInfo];
    [self.contentView addSubview:self.message_LAB];
    [self.contentView addSubview:self.ImagesV];
    [self.contentView addSubview:self.line];
    [self setupSubViewsFrame];
}


- (void)setupSubViewsFrame {
    
    self.BG.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .topSpaceToView(self.contentView, 0)
    .heightIs(10);
    
    self.headerInfo.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .topSpaceToView(self.BG, 22)
    .heightIs(45);
    
    self.message_LAB.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .topSpaceToView(self.headerInfo, 25);

}


#pragma mark 存取方法

- (void)setModel:(HomecellinfoModel *)model {
    _model = model;
    [self configData:model];
}

- (UIView *)BG {
    if (!_BG) {
        _BG = [[UIView alloc]init];
        _BG.backgroundColor = Col_ECE;
    }
    return _BG;
}

- (CurreryinfoV *)headerInfo {
    if (!_headerInfo) {
        _headerInfo = [[CurreryinfoV alloc]init];
    }
    return _headerInfo;
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

- (YYLabel *)message_LAB {
    if (!_message_LAB) {
        _message_LAB = [Create_Tool CreatLabeltextcolor:Col_666 textfont:[UIFont systemFontOfSize:12]];
    }
    return _message_LAB;
}

@end

