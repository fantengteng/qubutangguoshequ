//
//  HomeDetailCell.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeDetailCell.h"
#import "CurreryinfoV.h"
#import "CurreryImagSV.h"
#import "Homedianzan.h"
@interface HomeDetailCell ()

@property (nonatomic , strong) CurreryinfoV *headerInfo;

@property (nonatomic , strong) CurreryImagSV *ImagesV;

@property (nonatomic , strong) Homedianzan *dianzanV;

@property (nonatomic , strong) YYLabel *message_LAB;

@property (nonatomic , strong) UIView *line1;

@property (nonatomic , strong) UIView *line2;
@end

@implementation HomeDetailCell


#pragma mark 生命周期

#pragma mark 回调协议

#pragma mark 触发方法

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
    if (content) {
//        NSMutableArray *IMS = [NSMutableArray new];
//        for (NSDictionary *dic  in Data.imgList) {
//            [IMS addObject:dic[@"thumbnail"]];
//        }
        [self.ImagesV configbishizhenImageS:Data.imgList];
//        [self.ImagesV configImageS:IMS type:2];
    }
    
    [self.dianzanV configdianzanstr:[NSString stringWithFormat:@"%ld",(long)Data.storeCnt] pinglunstr:[NSString stringWithFormat:@"%ld",(long)Data.commentCnt] isDianzan:Data.upCnt];
    
    self.ImagesV.sd_layout
    .topSpaceToView(self.message_LAB, 0)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(self.ImagesV.H);
    
    self.line2.sd_layout
    .topSpaceToView(self.ImagesV, 15)
    .leftSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(1);
    
    self.dianzanV.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self.line2, 1)
    .heightIs(35);
    
    [self setupAutoHeightWithBottomView:self.dianzanV bottomMargin:10];

}

#pragma mark 私有方法


- (void)setupSubviewS {
    [self.contentView addSubview:self.headerInfo];
    self.line1 = [self creatLine];
    self.line2 = [self creatLine];
    [self.contentView addSubview:self.line1];
    [self.contentView addSubview:self.message_LAB];
    [self.contentView addSubview:self.ImagesV];
    [self.contentView addSubview:self.line2];
    [self.contentView addSubview:self.dianzanV];
    [self setupSubViewsFrame];
    @weakify(self)
    self.headerInfo.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (self.currencyClose) {
            self.currencyClose(num);
        }
    };
    
    self.dianzanV.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (self.currencyClose) {
            self.currencyClose(num);
        }
    };
}

- (void)setupSubViewsFrame {
    
    self.headerInfo.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .topSpaceToView(self.contentView, 17)
    .heightIs(45);
    
    self.line1.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .topSpaceToView(self.headerInfo, 15)
    .heightIs(1);
    
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

- (Homedianzan *)dianzanV {
    if (!_dianzanV) {
        _dianzanV = [[Homedianzan alloc]init];
    }
    return _dianzanV;
}

- (YYLabel *)message_LAB {
    if (!_message_LAB) {
        _message_LAB = [Create_Tool CreatLabeltextcolor:Col_666 textfont:[UIFont systemFontOfSize:12]];
    }
    return _message_LAB;
}
@end
