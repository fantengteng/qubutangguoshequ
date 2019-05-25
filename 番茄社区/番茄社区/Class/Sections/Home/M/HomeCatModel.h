//
//  HomeCatModel.h
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeCatModel : NSObject

@property (nonatomic , copy) NSString *imgUrl;

@property (nonatomic , assign) NSInteger categoryId;

@property (nonatomic , copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
