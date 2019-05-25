//
//  TansuoModel.h
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TansuoModel : NSObject
//"documentCode": "80d00e0a98195befc65a5014e76f06b33f3c5a6f91350b62d78d45d10195e548",
//"title": "第一个探索",
//"headImg": "http://f.163db.com.cn/document-img/b135358044a5468f9ec042e10cfed1d8.jpeg",
//"publishTime": 1556593050000,
//"detailType": 2,
//"content": "",
//"summary": "第一个探索摘要",
//"detailLink": "www.baidu.com",
//"formattedPublishTime": "2019-04-30 10:57",


@property (nonatomic , copy) NSString *documentCode;

@property (nonatomic , copy) NSString *title;

@property (nonatomic , copy) NSString *headImg;

@property (nonatomic , assign) NSInteger publishTime;

@property (nonatomic , assign) NSInteger detailType;

@property (nonatomic , copy) NSString *content;

@property (nonatomic , copy) NSString *summary;

@property (nonatomic , copy) NSString *detailLink;

@property (nonatomic , copy) NSString *formattedPublishTime;


@end

NS_ASSUME_NONNULL_END
