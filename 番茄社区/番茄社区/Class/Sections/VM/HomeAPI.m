//
//  HomeAPI.m
//  捕鱼达人
//
//  Created by linlin dang on 2019/3/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeAPI.h"

@implementation HomeAPI


- (void)configrequestMark:(NSString *)requestMark {
    NSString *Url;
    self.Is_Cache = NO;
    self.requestType = FTT_APIManagerRequestTypePOST;
    if ([requestMark isEqualToString:RegistMARK]) {
        Url = requestMark;
    }else if ([requestMark isEqualToString:LoginMARK]) {
        Url = LoginMARK;
    }else if ([requestMark isEqualToString:followUserMark]) {
        Url = followUserMark;
    }else if ([requestMark isEqualToString:changeNickNameMARK]) {
        Url = changeNickNameMARK;
    }else if ([requestMark isEqualToString:listFollowUserMARK]) {
        Url = listFollowUserMARK;
    }else if ([requestMark isEqualToString:blockUserMARK]) {
        Url = blockUserMARK;
    }else if ([requestMark isEqualToString:listBlockedUserMARK]) {
        
        Url = listBlockedUserMARK;
    }else if ([requestMark isEqualToString:changeAvatarMARK]) {
        self.requestType = FTT_APIManagerRequestTypeUpload;
        Url = changeAvatarMARK;
    }else if ([requestMark isEqualToString:docdetailMARK]) {
        Url = docdetailMARK;
    }
    
    
    
    
    
    
    else if ([requestMark isEqualToString:blogindexMARK]) {
        Url = blogindexMARK;
    }else if ([requestMark isEqualToString:bloglistCategoryMAKR]) {
        Url = bloglistCategoryMAKR;
    }else if ([requestMark isEqualToString:bloglistBlogMAKR]) {
        Url = bloglistBlogMAKR;
    }else if ([requestMark isEqualToString:bloglistMyBlogMARK]) {
        Url = bloglistMyBlogMARK;
    }else if ([requestMark isEqualToString:blogdeleteMyBlog]) {
        Url = blogdeleteMyBlog;
    }else if ([requestMark isEqualToString:bloglikeMARK]) {
        Url = bloglikeMARK;
    }else if ([requestMark isEqualToString:bloglistMyLikeMARK]) {
        Url = bloglistMyLikeMARK;
    }else if ([requestMark isEqualToString:blogsubmitCommentMARK]) {
        Url = blogsubmitCommentMARK;
    }else if ([requestMark isEqualToString:bloggetBlogDetailMARK ]) {
        Url = bloggetBlogDetailMARK ;
    }else if ([requestMark isEqualToString:bloglistBlogCommentMARK]) {
        Url = bloglistBlogCommentMARK;
    }else if ([requestMark isEqualToString:blogsubmitBlogMARK]) {
       self.requestType = FTT_APIManagerRequestTypeUpload;
        Url = blogsubmitBlogMARK;
    }else if ([requestMark isEqualToString:bloglistMyPhotoMARK]) {
        Url = bloglistMyPhotoMARK  ;
    }
    
    
    else if ([requestMark isEqualToString:doclistExploreMARK]) {
        Url = doclistExploreMARK;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    self.requestUrl  = [NSString stringWithFormat:@"%@%@",PZ_Header,Url];
    self.requestMark = requestMark;
}


@end
