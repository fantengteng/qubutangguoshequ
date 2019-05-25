//
//  HomeCatCell.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeCatCell.h"

@interface HomeCatCell ()

@property (nonatomic , strong) UIImageView *HeaderIMG;

@property (nonatomic , strong) YYLabel *Name_LAB;

@end

@implementation HomeCatCell


- (void)configData:(HomeCatModel *)Data {
    [self.HeaderIMG setImageWithURL:[NSURL URLWithString:Data.imgUrl]
             placeholder:[UIImage imageNamed:@"NONONO"]
                 options:YYWebImageOptionProgressive
                 manager:[Create_Tool ImageManager]
                progress:nil
               transform:nil
              completion:nil];
    
    self.Name_LAB.text = Data.name;
}

- (void)setupSubviewS {
    [self.contentView addSubview:self.HeaderIMG];
    [self.contentView addSubview:self.Name_LAB];
    [self setupSubViewsFrame];
}

- (void)setupSubViewsFrame {
    self.HeaderIMG.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .topSpaceToView(self.contentView, 15)
    .heightIs(62)
    .widthIs(62);
    
    self.Name_LAB.sd_layout
    .leftSpaceToView(self.HeaderIMG, 10)
    .rightSpaceToView(self.contentView, 15)
    .topEqualToView(self.contentView)
    .bottomEqualToView(self.contentView);
}

- (UIImageView *)HeaderIMG {
    if (!_HeaderIMG) {
        _HeaderIMG = [[UIImageView alloc]init];
        _HeaderIMG.size = CGSizeMake(62, 62);
        _HeaderIMG.layer.cornerRadius = 3;
        _HeaderIMG.layer.masksToBounds = YES;
    }
    return _HeaderIMG;
}


- (YYLabel *)Name_LAB {
    if (!_Name_LAB) {
        _Name_LAB = [Create_Tool CreatLabeltextcolor:Col_333 textfont:[UIFont boldSystemFontOfSize:16]];
    }
    return _Name_LAB;
}
@end
