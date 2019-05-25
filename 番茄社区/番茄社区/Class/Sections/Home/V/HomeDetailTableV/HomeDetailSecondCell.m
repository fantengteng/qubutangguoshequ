//
//  HomeDetailSecondCell.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeDetailSecondCell.h"

@interface HomeDetailSecondCell ()

@property (nonatomic , strong) UIImageView *HeaderIMG;

@property (nonatomic , strong) YYLabel *Name_LAB;

@property (nonatomic , strong) YYLabel *message_LAB;

@property (nonatomic , strong) YYLabel *Time_LAB;

@end

@implementation HomeDetailSecondCell




#pragma mark 生命周期

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

#pragma mark 回调协议

#pragma mark 触发方法

#pragma mark 公开方法

- (void)configData:(HomeSecondmodel *)Data {
    
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
    
    self.Name_LAB.text = Data.publisher[@"nickName"];
    self.Time_LAB.text = Data.publishTime;
    [self.HeaderIMG setImageWithURL:[NSURL URLWithString:Data.publisher[@"avatar"]]
                        placeholder:[UIImage imageNamed:@"NONONO"]
                            options:YYWebImageOptionProgressive
                            manager:[Create_Tool ImageManager]
                           progress:nil
                          transform:nil
                         completion:nil];
    
    self.Time_LAB.sd_layout
    .leftEqualToView(self.Name_LAB)
    .rightSpaceToView(self.contentView, 15)
    .topSpaceToView(self.message_LAB, 5)
    .heightIs(15);
    
    [self setupAutoHeightWithBottomView:self.Time_LAB bottomMargin:10];
}

#pragma mark 私有方法

- (void)setupSubviewS {
    [self.contentView addSubview:self.HeaderIMG];
    [self.contentView addSubview:self.Name_LAB];
    [self.contentView addSubview:self.message_LAB];
    [self.contentView addSubview:self.Time_LAB];
    [self setupSubViewsFrame];
}

- (void)setupSubViewsFrame {
    self.HeaderIMG.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.contentView, 15)
    .widthIs(45)
    .heightIs(45);
    
    self.Name_LAB.sd_layout
    .leftSpaceToView(self.HeaderIMG, 10)
    .topSpaceToView(self.contentView, 18)
    .widthIs(150)
    .heightIs(15);
    
    self.message_LAB.sd_layout
    .leftEqualToView(self.Name_LAB)
    .topSpaceToView(self.Name_LAB, 2)
    .rightSpaceToView(self.contentView, 15);
}
#pragma mark 存取方法

- (void)setSecondmodel:(HomeSecondmodel *)secondmodel {
    _secondmodel = secondmodel;
    [self configData:secondmodel];
}

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
        _Name_LAB = [Create_Tool CreatLabeltextcolor:Col_666 textfont:[UIFont boldSystemFontOfSize:11]];
    }
    return _Name_LAB;
}

- (YYLabel *)message_LAB {
    if (!_message_LAB) {
        _message_LAB = [Create_Tool CreatLabeltextcolor:Col_333 textfont:[UIFont systemFontOfSize:12]];
    }
    return _message_LAB;
}

- (YYLabel *)Time_LAB {
    if (!_Time_LAB) {
        _Time_LAB = [Create_Tool CreatLabeltextcolor:Col_999 textfont:[UIFont systemFontOfSize:10]];
    }
    return _Time_LAB;
}


@end
