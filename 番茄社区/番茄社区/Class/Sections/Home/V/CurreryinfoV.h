//
//  CurreryinfoV.h
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TT_BaseV.h"

NS_ASSUME_NONNULL_BEGIN

@interface CurreryinfoV : TT_BaseV

@property (nonatomic , strong) UIImageView *HeaderIMG;

@property (nonatomic , strong) YYLabel *Name_LAB;

@property (nonatomic , strong) YYLabel *Time_LAB;

@property (nonatomic , strong) UIButton  *collect_btn;

- (void)configheaderImageName:(NSString *)ImageName nameStr:(NSString *)nameStr timeStr:(NSString *)timeStr;

- (void)configCollec_btnStr:(NSString *)Str imageStr:(NSString *)imageStr;
@end

NS_ASSUME_NONNULL_END
