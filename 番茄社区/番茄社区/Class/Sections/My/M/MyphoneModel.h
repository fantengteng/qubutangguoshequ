//
//  MyphoneModel.h
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyphoneModel : NSObject

//"img": "http://f.163db.com.cn/blog-img/5\\d59ad8fc5e4045a8a6b183ce28f7b5e6.jpeg",
//"thumbnail": "http://f.163db.com.cn/blog-img/5\\b362d368-3137-47e8-a283-63524e03b1d2.jpeg",
//"width": 700,
//"height": 1307

@property (nonatomic , copy) NSString *img;

@property (nonatomic , copy) NSString *thumbnail;

@property (nonatomic , assign) CGFloat width;

@property (nonatomic , assign) CGFloat height;



@end

NS_ASSUME_NONNULL_END
