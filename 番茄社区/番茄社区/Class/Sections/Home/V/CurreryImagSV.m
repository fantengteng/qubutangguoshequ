//
//  CurreryImagSV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "CurreryImagSV.h"

@implementation CurreryImagSV


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createIMG];
    }
    return self;
}

- (void)createIMG {
    for (int i = 0; i < 3; i++) {
        UIImageView *IMG = [TT_ControlTool FTT_ControlToolUIImageViewFrame:CGRectZero
                                                                 ImageName:@"NONO"
                                                    userInteractionEnabled:NO
                                                             MasksToBounds:NO
                                                             ConrenrRadius:0
                                                               BorderColor:Col_ECE
                                                               BorderWidth:1
                                                                LabelBlock:nil];
        IMG.contentMode = UIViewContentModeScaleAspectFit;
        IMG.tag = i + 1000;
        [self addSubview:IMG];
    }
}
- (void)configImageS:(NSMutableArray *)ImageS type:(NSInteger)type {
    if (ImageS) {
        NSInteger num ;
        CGFloat H ;
        CGFloat IMGH = (KScreenWidth - 50) / 3;
        if (type == 1) {
            if (ImageS.count > 3) {
                num = 3;
            }else {
                num = ImageS.count;
            }
            H = IMGH + 30;
        }else {
            IMGH = KScreenWidth - 30;
            num = ImageS.count;
            H = 15 + (IMGH + 10) * num;
        }
    
        for (int i = 0; i < 3; i++) {
            UIImageView *IMG = [self viewWithTag:1000 +i];
            if (i>=num) {
                IMG.hidden = YES;
            }else {
                IMG.hidden = NO;
            }
        }
        for (int i = 0; i < num; i++) {
            UIImageView *IMG = [self viewWithTag:1000 +i];
            if (type == 1) {
                IMG.sd_layout
                .leftSpaceToView(self, 15 + (IMGH + 10) * i)
                .topSpaceToView(self, 15)
                .widthIs(IMGH)
                .heightIs(IMGH);
            }else {
                IMG.sd_layout
                .leftSpaceToView(self, 15)
                .topSpaceToView(self, 15 + (IMGH + 10) * i)
                .widthIs(IMGH)
                .heightIs(IMGH);
            }
            
            [IMG setImageWithURL:[NSURL URLWithString:ImageS[i]]
                     placeholder:[UIImage imageNamed:@"NONONO"]
                         options:YYWebImageOptionProgressive
                         manager:[Create_Tool ImageManager]
                        progress:nil
                       transform:nil
                      completion:nil];
            
        }
        self.H = H;
    }
}

- (void)configbishizhenImageS:(NSMutableArray *)ImageS {
    CGFloat HH = 15;
    
    for (int i = 0; i < 3; i++) {
        UIImageView *IMG = [self viewWithTag:1000 +i];
        if (i>= ImageS.count) {
            IMG.hidden = YES;
        }else {
            IMG.hidden = NO;
        }
    }
    
    CGFloat IMGW = KScreenWidth - 30;
    for (int i = 0 ; i < ImageS.count ; i++) {
        NSDictionary *dic = ImageS[i];
        UIImageView *IMG = [self viewWithTag:1000 +i];
        CGFloat W = [dic[@"width"] floatValue];
        CGFloat H = [dic[@"height"] floatValue];
        CGFloat bl = W / H;
        CGFloat IMGH = IMGW / bl;
        IMG.sd_layout
        .leftSpaceToView(self, 15)
        .topSpaceToView(self,HH)
        .widthIs(IMGW)
        .heightIs(IMGH);
        
        HH = IMGH + HH ;
        
        [IMG setImageWithURL:[NSURL URLWithString:dic[@"thumbnail"]]
                 placeholder:[UIImage imageNamed:@"NONONO"]
                     options:YYWebImageOptionProgressive
                     manager:[Create_Tool ImageManager]
                    progress:nil
                   transform:nil
                  completion:nil];
        
    }
    self.H = HH;

}

@end
