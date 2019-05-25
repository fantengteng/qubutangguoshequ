//
//  TabBarTool.h
//  捕鱼达人
//
//  Created by linlin dang on 2019/3/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TabBarTool : NSObject
@property (nonatomic , strong) UIView *ZTBF;
@property (nonatomic , strong) CALayer *CenterLayer;
/// 通用的触发事件
@property (nonatomic , copy) void(^ViewtapClose)(NSInteger num, id data);
+ (instancetype)Share_TabBarTool;
- (void)CreateTabBar;
- (void)CreateLoginC:(UIViewController *)C;
- (void)islogin:(UIViewController *)V Close:(void(^)(void))Close ;
- (void)configisLoginv:(UIViewController *)V ;
@end

NS_ASSUME_NONNULL_END
