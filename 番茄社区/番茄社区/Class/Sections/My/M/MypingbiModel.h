//
//  MypingbiModel.h
//  番茄社区
//
//  Created by linlin dang on 2019/4/27.
//  Copyright © 2019 FTT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MypingbiModel : NSObject
//{
//    "relatedUserCode": "c652f79e7d774e59ae66424be72aad4b",
//    "nickName": "开拓者11",
//    "avatar": "http://f.163db.com.cn/user-avatar/5/f714e711fcb64329b14bd8ec5e850f25.jpg",
//    "time": 1556351494000,
//    "operateTime": "2019-04-27 15:51"
//}

@property (nonatomic , copy) NSString *relatedUserCode;

@property (nonatomic , copy) NSString *nickName;

@property (nonatomic , copy) NSString *avatar;

@property (nonatomic , copy) NSString *time;

@property (nonatomic , copy) NSString *operateTime;

@end

NS_ASSUME_NONNULL_END
