//
//  MallBannerCell.m
//  捕鱼达人
//
//  Created by linlin dang on 2019/3/27.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MallBannerCell.h"

@interface MallBannerCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation MallBannerCell



#pragma mark 生命周期

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_imageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(10, 10, KScreenWidth - 20, (KScreenWidth - 20) / 25 * 9);
}

#pragma mark 回调协议

#pragma mark 触发方法

#pragma mark 公开方法

#pragma mark 私有方法

#pragma mark 存取方法

- (void)setImageURL:(NSURL *)imageURL {
    [self.imageView setImageWithURL:imageURL
                        placeholder:nil
                            options:YYWebImageOptionProgressive
                            manager:[Create_Tool ImageManager]
                           progress:nil
                          transform:nil
                         completion:nil];
}

@end
