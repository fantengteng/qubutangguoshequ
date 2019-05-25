//
//  HomeSecondmodel.h
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeSecondmodel : NSObject
//{
//    "commentId": 2,
//    "content": "试试吧2",
//    "createdTime": 1556271925000,
//    "publishTime": "2019-04-26 17:45",
//    "publisher": {
//        "userCode": "c652f79e7d774e59ae66424be72aad4b",
//        "nickName": "开拓者11",
//        "avatar": "http://f.163db.com.cn/user-avatar/5/f714e711fcb64329b14bd8ec5e850f25.jpg"
//    }
//},


@property (nonatomic , assign) NSInteger commentId;

@property (nonatomic , copy) NSString *content;

@property (nonatomic , assign) NSInteger createdTime;

@property (nonatomic , copy) NSString *publishTime;

@property (nonatomic , copy) NSDictionary *publisher;

@end

NS_ASSUME_NONNULL_END
