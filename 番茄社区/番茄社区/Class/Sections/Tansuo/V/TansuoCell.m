//
//  TansuoCell.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TansuoCell.h"

@interface TansuoCell ()
@property (nonatomic , strong) UIImageView *HeaderIMG;
@end

@implementation TansuoCell

- (void)awakeFromNib {
    [super awakeFromNib];
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)configData:(TansuoModel *)Data {
    
    
    [self.HeaderIMG setImageWithURL:[NSURL URLWithString:Data.headImg]
             placeholder:[UIImage imageNamed:@"NONONO"]
                 options:YYWebImageOptionProgressive
                 manager:[Create_Tool ImageManager]
                progress:nil
               transform:nil
              completion:nil];
    
    [self setupAutoHeightWithBottomView:self.HeaderIMG bottomMargin:1];
}

- (void)setupSubviewS {
    [self.contentView addSubview:self.HeaderIMG];
    self.HeaderIMG.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .topSpaceToView(self.contentView, 15)
    .heightIs((KScreenWidth - 30) / 7 * 4);
}

- (void)setModel:(TansuoModel *)model {
    _model = model;
    [self configData:model];
}
- (UIImageView *)HeaderIMG {
    if (!_HeaderIMG) {
        _HeaderIMG = [[UIImageView alloc]init];
        _HeaderIMG.backgroundColor = Col_ECE;
    }
    return _HeaderIMG;
}


@end
