//
//  MyphoeCell.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyphoeCell.h"

@implementation MyphoeCell



/// 添加视图
- (void)tt_setupSubViewS {
    [self.contentView addSubview:self.HeaderIMG];
    self.HeaderIMG.backgroundColor = Col_666;
    [self tt_setupSubFrameS];
    
}
/// 设置Frame
- (void)tt_setupSubFrameS {
    self.HeaderIMG.frame = self.bounds;
}

- (void)configforData:(MyphoneModel *)Data {
    
    [self.HeaderIMG setImageWithURL:[NSURL URLWithString:Data.thumbnail]
                        placeholder:[UIImage imageNamed:@"NONONO"]
                            options:YYWebImageOptionProgressive
                            manager:[Create_Tool ImageManager]
                           progress:nil
                          transform:nil
                         completion:nil];
    
}

- (UIImageView *)HeaderIMG {
    if (!_HeaderIMG) {
        _HeaderIMG = [[UIImageView alloc]init];
    }
    return _HeaderIMG;
}

@end
