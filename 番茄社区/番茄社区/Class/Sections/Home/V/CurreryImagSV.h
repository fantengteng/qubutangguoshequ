//
//  CurreryImagSV.h
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TT_BaseV.h"

NS_ASSUME_NONNULL_BEGIN

@interface CurreryImagSV : TT_BaseV

@property (nonatomic , assign) CGFloat H;

- (void)configImageS:(NSMutableArray *)ImageS type:(NSInteger)type;
- (void)configbishizhenImageS:(NSMutableArray *)ImageS;
@end

NS_ASSUME_NONNULL_END
