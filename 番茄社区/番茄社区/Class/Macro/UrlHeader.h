
//
//  UrlHeader.h
//  捕鱼达人
//
//  Created by linlin dang on 2019/3/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#ifndef UrlHeader_h
#define UrlHeader_h


#define PZ_Header      @"https://zzyuanshun.cn/smart-api"


///  ====== 用户相关的 ====== ///

/// 注册
#define RegistMARK     @"/client/register"
/// 登录
#define LoginMARK      @"/client/login"
/// 关注用户
#define followUserMark @"/client/followUser"
/// 修改用户名
#define changeNickNameMARK @"/client/changeNickName"
/// 更换头像
#define changeAvatarMARK  @"/client/changeAvatar"
/// 关注列表
#define listFollowUserMARK @"/client/listFollowUser"
/// 屏蔽用户
#define blockUserMARK @"/client/blockUser"
/// 屏蔽列表
#define listBlockedUserMARK @"/client/listBlockedUser"


///  ====== 首页相关的 ====== ///

/// 首页帖子
#define blogindexMARK  @"/blog/index"




///  ====== 帖子相关的 ====== ///
/// 对应的帖子列表
#define bloglistBlogMAKR @"/blog/listBlog"
/// 我的帖子
#define bloglistMyBlogMARK @"/blog/listMyBlog"
/// 删除我的帖子
#define blogdeleteMyBlog @"/blog/deleteMyBlog"
/// 添加喜欢的帖子
#define bloglikeMARK @"/blog/like"
/// 我喜欢的帖子
#define bloglistMyLikeMARK @"/blog/listMyLike"
/// 发表评论
#define blogsubmitCommentMARK @"/blog/submitComment"
/// 获取帖子详情
#define bloggetBlogDetailMARK @"/blog/getBlogDetail"
/// 获取评论信息
#define bloglistBlogCommentMARK @"/blog/listBlogComment"
/// 发布帖子
#define blogsubmitBlogMARK @"/blog/submitBlog"
/// 获取照片
#define bloglistMyPhotoMARK @"/blog/listMyPhoto"
/// 获取帖子分类
#define bloglistCategoryMAKR @"/blog/listCategory"


///  ====== 探索 ====== ///

#define doclistExploreMARK @"/doc/listExplore"

#define docdetailMARK @"/doc/detail"


#define USER_ID \
NSString *usee_id;\
Exist(@"userId"){\
usee_id = TakeOut(@"userId");\
}else {\
usee_id = @"";\
}\

#define Token \
NSString *token;\
Exist(@"token") {\
token = TakeOut(@"token");\
}else {\
token = @"";\
}\

#endif /* UrlHeader_h */
