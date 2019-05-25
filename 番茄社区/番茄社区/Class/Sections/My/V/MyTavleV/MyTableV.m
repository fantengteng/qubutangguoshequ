//
//  MyTableV.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyTableV.h"
#import "MyheadeV.h"

@interface MyTableV ()

@property (nonatomic , strong) NSMutableArray *arr_IMG;

@property (nonatomic , strong) NSMutableArray *arr_title;

@property (nonatomic , strong) MyheadeV *headeV;

@end


@implementation MyTableV

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *Cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    Cell.imageView.image = [UIImage imageNamed: self.arr_IMG[indexPath.row]];
    Cell.textLabel.text = self.arr_title[indexPath.row];
    Cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return Cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr_title.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.TT_delegate != nil && [self.TT_delegate respondsToSelector:@selector(tapcellTriggereventIndex:model:)]) {
        [self celltapDelegateIndexPath:indexPath data:@""];
    }
}
#pragma mark 触发方法


#pragma mark 公开方法

- (void)configName {
    USER_ID
    if ([usee_id isEqualToString:@""]) {
        [self.headeV configImageStr:@"" name:@""];
    }else {
        NSDictionary *user = TakeOut(@"user");
        [self.headeV configImageStr:user[@"avatar"] name:user[@"nickName"]] ;
    }
}

#pragma mark 私有方法

- (void)changeDefaultConfigguration {
    self.headeV = [[MyheadeV alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 220)];
    self.tableHeaderView = self.headeV;
    @weakify(self)
    self.headeV.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (self.tapClose) {
            self.tapClose(num, data);
        }
    };
   
    
    _arr_IMG = [NSMutableArray arrayWithArray:@[@"guanzhud",@"fabud",@"pingbi",@"xiangce",@"dianzand",@"shezhi"]];
    _arr_title = [NSMutableArray arrayWithArray:@[@"我的关注",@"我的发布",@"我的屏蔽",@"我的相册",@"我的点赞",@"设置"]];
    self.infodata = [NSMutableArray arrayWithArray:@[@"guanzhud",@"fabud",@"pingbi",@"xiangce",@"dianzand",@"shezhi"]];
}


#pragma mark 存取方法


@end
