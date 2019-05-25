//
//  HomeVM.m
//  捕鱼达人
//
//  Created by linlin dang on 2019/3/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeVM.h"
#import "HomecellinfoModel.h"
#import "HomeCatModel.h"
#import "HomeSecondmodel.h"
#import "TansuoModel.h"
#import "MypingbiModel.h"
#import "MyguanzhuModel.h"
#import "MyphoneModel.h"

@implementation HomeVM


- (NSDictionary *)paramsForApi:(FTT_APIBaseManager *)Manager {
    [self.DIC setValue:@"bbs5" forKey:@"appCode"];
    [self.DIC setValue:@"2" forKey:@"deviceType"];
    [self.DIC setValue:TT_Version forKey:@"version"];
    USER_ID
    Token
    if (![usee_id isEqualToString:@"0"]) {
        [self.DIC setValue:usee_id forKey:@"userCode"];
        [self.DIC setValue:token forKey:@"token"];
    }
    return self.DIC;
}


- (void)dataConversion:(FTT_APIBaseManager *)Manager {

    if ([Manager.requestMark isEqualToString:RegistMARK]) {
        [self loginOrRegistmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:LoginMARK]) {
        [self loginOrRegistmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:followUserMark]) {
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:changeNickNameMARK]) {
        SaveObject(Manager.responseObject[@"info"], @"user")
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:listFollowUserMARK]) {
        [self listFollowUsermethod:Manager];
    }else if ([Manager.requestMark isEqualToString:blockUserMARK]) {
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:listBlockedUserMARK]) {
        [self listFollowUsermethod:Manager];
    }else if ([Manager.requestMark isEqualToString:changeAvatarMARK]) {
        SaveObject(Manager.responseObject[@"info"], @"user")
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:docdetailMARK]) {
        
    }
    
    
    
    
    
    else if ([Manager.requestMark isEqualToString:blogindexMARK]) {
        [self configHomeBlogindexmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:bloglistCategoryMAKR]) {
        [self bloglistCategorymethod:Manager];
    }else if ([Manager.requestMark isEqualToString:bloglistBlogMAKR]) {
        [self bloglistMylikemethod:Manager];
    }else if ([Manager.requestMark isEqualToString:bloglistBlogCommentMARK]) {
        [self bloglistBlogCommentmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:blogsubmitCommentMARK]) {
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:bloglikeMARK]) {
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:bloglistMyPhotoMARK]) {
        [self bloglistMyPhotomethod:Manager];
    }else if ([Manager.requestMark isEqualToString:bloglistMyLikeMARK]) {
        [self bloglistMylikemethod:Manager];
    }else if ([Manager.requestMark isEqualToString:bloglistMyBlogMARK]) {
        [self bloglistMylikemethod:Manager];
    }else if ([Manager.requestMark isEqualToString:blogdeleteMyBlog]) {
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:blogsubmitBlogMARK]) {
        [self ElasticGeneralmethod:Manager];
    }
    
    
    
    else if ([Manager.requestMark isEqualToString:doclistExploreMARK]) {
        [self doclistExploremethod:Manager];
    }
    
    
    
}


- (void)bloglistMylikemethod:(FTT_APIBaseManager *)Manager {
    
    NSMutableArray *blogList = [HomecellinfoModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"info"]];
    [self configAllData:Manager.responseObject Data:blogList success:YES hasmore:YES Mark:Manager.requestMark];
}

- (void)bloglistMyPhotomethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *data = [MyphoneModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"info"]];
    [self configAllData:Manager.responseObject Data:data success:YES hasmore:YES Mark:Manager.requestMark];
}

- (void)listBlockedUsermethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *data = [MypingbiModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"info"]];
    [self configAllData:Manager.responseObject Data:data success:YES hasmore:YES Mark:Manager.requestMark];
}

- (void)listFollowUsermethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *data = [MyguanzhuModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"info"]];
    [self configAllData:Manager.responseObject Data:data success:YES hasmore:YES Mark:Manager.requestMark];
}

- (void)doclistExploremethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *data = [TansuoModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"info"]];
    [self configAllData:Manager.responseObject Data:data success:YES hasmore:YES Mark:Manager.requestMark];
}

- (void)bloglistBlogCommentmethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *comment = [HomeSecondmodel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"info"]];
    [self configAllData:Manager.responseObject Data:comment success:YES hasmore:YES Mark:Manager.requestMark];
}

- (void)bloggetBlogDetailmethod:(FTT_APIBaseManager *)Manager  {
    HomecellinfoModel *model = [HomecellinfoModel mj_objectWithKeyValues:Manager.responseObject[@"info"]];
    NSMutableArray *data = [NSMutableArray new];
    [data addObject:model];
    [self configAllData:Manager.responseObject Data:data success:YES hasmore:NO Mark:Manager.requestMark];
}

- (void)bloglistCategorymethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *Cat = [HomeCatModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"info"]];
    [self configAllData:Manager.responseObject Data:Cat success:YES hasmore:NO Mark:Manager.requestMark];
}

- (void)loginOrRegistmethod:(FTT_APIBaseManager *)Manager {
    NSDictionary *info = Manager.responseObject;
    SaveObject(info[@"info"][@"token"][@"token"], @"token")
    SaveObject(info[@"info"][@"user"][@"userCode"], @"userId")
    SaveObject(info[@"info"][@"user"], @"user")
    [self ElasticGeneralmethod:Manager];
}

- (void)configbloglistBlogmethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *banner = [HomeBannerModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"info"]];
    [self configAllData:Manager.responseObject Data:banner success:YES hasmore:YES Mark:Manager.requestMark];
}

- (void)configHomeBlogindexmethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *banner = [HomeBannerModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"info"][@"navList"]];
    NSMutableArray *blogList = [HomecellinfoModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"info"][@"blogList"]];
    NSMutableArray *data = [NSMutableArray new];
    [data addObject:banner];
    [data addObject:blogList];
    if (self.New_Close) {
        self.New_Close(Manager.responseObject, data, YES, NO, Manager.requestMark);
    }
}

- (void)ElasticGeneralmethod:(FTT_APIBaseManager *)Manager {
    if (self.New_Close) {
        self.New_Close(Manager.responseObject, nil, YES, NO, Manager.requestMark);
    }
}










@end
