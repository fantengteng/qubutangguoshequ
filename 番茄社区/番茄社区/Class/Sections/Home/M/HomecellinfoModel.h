//
//  HomecellinfoModel.h
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomecellinfoModel : NSObject

@property (nonatomic , assign) NSInteger auditStatus;

@property (nonatomic , assign) NSInteger blogId;

@property (nonatomic , assign) NSInteger commentCnt;

@property (nonatomic , copy) NSString *content;

@property (nonatomic , assign) NSInteger createdTime;

@property (nonatomic , assign) NSInteger followed;

@property (nonatomic , copy) NSMutableArray *imgList;

@property (nonatomic , assign) NSInteger praised;

@property (nonatomic , copy) NSString *publishTime;

@property (nonatomic , copy) NSDictionary *publisher;

@property (nonatomic , assign) NSInteger storeCnt;

@property (nonatomic , assign) NSInteger stored;

@property (nonatomic , copy) NSString *topicName;

@property (nonatomic , assign) NSInteger upCnt;

@end


@interface HomeBannerModel : NSObject

@property (nonatomic , copy) NSString *imgUrl;

@property (nonatomic , copy) NSString *linkUrl;

@property (nonatomic , copy) NSString *name;

@property (nonatomic , assign) NSInteger type;

@end
NS_ASSUME_NONNULL_END
