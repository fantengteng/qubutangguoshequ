//
//  MyguanzhuCell.h
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TT_BaseCell.h"
#import "MyguanzhuModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyguanzhuCell : TT_BaseCell
@property (nonatomic , assign) NSInteger type;
@property (nonatomic , strong) MyguanzhuModel *model;
@end

NS_ASSUME_NONNULL_END
