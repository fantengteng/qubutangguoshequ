//
//  MyguanzhuCell.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyguanzhuCell.h"


@interface MyguanzhuCell ()

@property (nonatomic , strong) UIImageView *HeaderIMG;

@property (nonatomic , strong) YYLabel *Name_LAB;

@property (nonatomic , strong) UIButton  *collect_btn;

@property (nonatomic , strong) UIButton *btn;

@end

@implementation MyguanzhuCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)tap_collect {
    if (self.currencyClose) {
        self.currencyClose(1);
    }
}

- (void)quxiao {
    if (self.currencyClose) {
        self.currencyClose(2);
    }
}

- (void)configData:(MyguanzhuModel *)Data {
    
    [self.HeaderIMG setImageWithURL:[NSURL URLWithString:Data.avatar]
             placeholder:[UIImage imageNamed:@"NONONO"]
                 options:YYWebImageOptionProgressive
                 manager:[Create_Tool ImageManager]
                progress:nil
               transform:nil
              completion:nil];
    
    self.Name_LAB.text = Data.nickName;
}


- (void)setType:(NSInteger)type {
    
    [self.contentView addSubview:self.HeaderIMG];
    [self.contentView addSubview:self.Name_LAB];
    
    self.HeaderIMG.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.contentView, 15)
    .widthIs(45)
    .heightIs(45);
    if (type == 1) {
        [self.contentView addSubview:self.collect_btn];
        [self.btn removeAllSubviews];
        self.collect_btn.sd_layout
        .rightSpaceToView(self.contentView, 15)
        .centerYEqualToView(self.contentView)
        .widthIs(60)
        .heightIs(30);
        
        self.Name_LAB.sd_layout
        .leftSpaceToView(self.HeaderIMG, 10)
        .topEqualToView(self.contentView)
        .rightSpaceToView(self.collect_btn, 0)
        .bottomEqualToView(self.contentView);
        
        
    }else {
        [self.collect_btn removeAllSubviews];
        [self.contentView addSubview:self.btn];
        self.btn.sd_layout
        .rightSpaceToView(self.contentView, 15)
        .centerYEqualToView(self.contentView)
        .widthIs(60)
        .heightIs(30);
        
        self.Name_LAB.sd_layout
        .leftSpaceToView(self.HeaderIMG, 10)
        .topEqualToView(self.contentView)
        .rightSpaceToView(self.btn, 0)
        .bottomEqualToView(self.contentView);
       
    }
    
}


- (void)setModel:(MyguanzhuModel *)model {
    _model = model;
    [self configData:model];
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
        _Name_LAB = [Create_Tool CreatLabeltextcolor:Col_333 textfont:[UIFont boldSystemFontOfSize:16]];
    }
    return _Name_LAB;
}


- (UIButton *)btn {
    if (!_btn) {
        _btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectZero
                                                     taeget:self
                                                        sel:@selector(quxiao)
                                                        tag:0
                                                   AntTitle:@"取消屏蔽"
                                                  titleFont:13
                                                 titleColor:Col_666
                                                   andImage:@"NONO"
                                               AndBackColor:nil
                                    adjustsFontSizesTowidth:NO
                                              masksToBounds:YES
                                               conrenRadius:5
                                                BorderColor:Col_666
                                                BorderWidth:1
                                  ContentHorizontalAligment:0];
    }
    return _btn;
}

- (UIButton *)collect_btn {
    if (!_collect_btn) {
   

        
        _collect_btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectZero
                                                             taeget:self
                                                                sel:@selector(tap_collect)
                                                                tag:0
                                                           AntTitle:@"取消关注"
                                                          titleFont:10
                                                         titleColor:Col_228
                                                           andImage:nil
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
