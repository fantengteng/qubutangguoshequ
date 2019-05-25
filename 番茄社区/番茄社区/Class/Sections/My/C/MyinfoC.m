//
//  MyinfoC.m
//  番茄社区
//
//  Created by linlin dang on 2019/5/7.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyinfoC.h"
#import "TT_TextV.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <Photos/Photos.h>
#import "TZImagePickerController/TZImagePickerController.h"
@interface MyinfoC ()<TT_TextVDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,TZImagePickerControllerDelegate>
@property (nonatomic , strong) TT_TextV *textV;
@property (strong, nonatomic) CLLocation *location;

@property (nonatomic, strong) UIImagePickerController *imagePickerVc;

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation MyinfoC

#pragma mark 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Col_FFF;
    self.Is_hideJuhuazhuan = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.textV TextViewDeleate];
}

#pragma mark 协议回调

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [[TZImageManager manager] savePhotoWithImage:image location:self.location completion:^(PHAsset *asset, NSError *error){
            [tzImagePickerVc hideProgressHUD];
            if (error) {
                //                NSLog(@"图片保存失败 %@",error);
            } else {
                TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
            }
        }];
    } else if ([type isEqualToString:@"public.movie"]) {
        NSURL *videoUrl = [info objectForKey:UIImagePickerControllerMediaURL];
        if (videoUrl) {
            [[TZImageManager manager] saveVideoWithUrl:videoUrl location:self.location completion:^(PHAsset *asset, NSError *error) {
                [tzImagePickerVc hideProgressHUD];
                if (!error) {
                    TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                    [[TZImageManager manager] getPhotoWithAsset:assetModel.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
                        if (!isDegraded && photo) {
                            [self refreshCollectionViewWithAddedAsset:assetModel.asset image:photo];
                        }
                    }];
                }
            }];
        }
    }
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    [self configChangeIMG:photos[0]];
    self.operationQueue = [[NSOperationQueue alloc] init];
    self.operationQueue.maxConcurrentOperationCount = 1;
}


- (void)refreshCollectionViewWithAddedAsset:(PHAsset *)asset image:(UIImage *)image {
    [self configChangeIMG:image];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)TT_TextVtapSendTriggereventWithtext:(NSString *)text {
    if (text.length == 0 || [text isEqualToString:self.textV.placeholdstr]) {
        [[FTT_HudTool share_FTT_HudTool] CreateHUD:@"请输入内容" AndView:self.view AndMode:MBProgressHUDModeCustomView AndImage:@"cuo" AndAfterDelay:1 AndBack:nil];
    }else {
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"正在提交，请稍后!!!"
                                          AndView:self.view
                                          AndMode:MBProgressHUDModeIndeterminate
                                         AndImage:@"NONO"
                                          AndBack:nil];
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:text forKey:@"nickName"];
        [self configDataforNewnetWorkname:changeNickNameMARK params:dic networkClass:[HomeAPI class]];
    }
}




#pragma mark 触发方法

- (void)changeheaderIMG {
    [self pushTZImagePickerController];
//    NSString *takePhotoTitle = @"拍照";
//    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//    UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:takePhotoTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [self takePhoto];
//    }];
//    [alertVc addAction:takePhotoAction];
//    UIAlertAction *imagePickerAction = [UIAlertAction actionWithTitle:@"去相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [self pushTZImagePickerController];
//    }];
//    [alertVc addAction:imagePickerAction];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    [alertVc addAction:cancelAction];
//    [self presentViewController:alertVc animated:YES completion:nil];
}

- (void)takePhoto {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        [FTT_Helper CreateTitle:@"温馨提示" message:@"请您设置允许该应用访问您的相机\n设置>隐私>相机" Sure:@"好的" preferredStyle:UIAlertControllerStyleAlert action:nil ViewController:self];
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        // fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self takePhoto];
                });
            }
        }];
        // 拍照之前还需要检查相册权限
    } else if ([PHPhotoLibrary authorizationStatus] == 2) { // 已被拒绝，没有相册权限，将无法保存拍的照片
     
            [FTT_Helper CreateTitle:@"温馨提示" message:@"请您设置允许该应用访问您的相机\n设置>隐私>相机" Sure:@"好的" preferredStyle:UIAlertControllerStyleAlert action:nil ViewController:self];
    } else if ([PHPhotoLibrary authorizationStatus] == 0) { // 未请求过相册权限
        [[TZImageManager manager] requestAuthorizationWithCompletion:^{
            [self takePhoto];
        }];
    } else {
        [self pushImagePickerController];
    }
}


- (void)pushTZImagePickerController {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:3 delegate:self pushPhotoPickerVc:YES];
    imagePickerVc.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];
    imagePickerVc.showSelectedIndex = YES;
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    imagePickerVc.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    [imagePickerVc setPhotoPickerPageUIConfigBlock:^(UICollectionView *collectionView, UIView *bottomToolBar, UIButton *previewButton, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel, UIView *divideLine) {
        [doneButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

// 调用相机
- (void)pushImagePickerController {
    // 提前定位
    __weak typeof(self) weakSelf = self;
    [[TZLocationManager manager] startLocationWithSuccessBlock:^(NSArray<CLLocation *> *locations) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.location = [locations firstObject];
    } failureBlock:^(NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.location = nil;
    }];
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        self.imagePickerVc.sourceType = sourceType;
        NSMutableArray *mediaTypes = [NSMutableArray array];
        [mediaTypes addObject:(NSString *)kUTTypeMovie];
        [mediaTypes addObject:(NSString *)kUTTypeImage];
        if (mediaTypes.count) {
            _imagePickerVc.mediaTypes = mediaTypes;
        }
        [self presentViewController:_imagePickerVc animated:YES completion:nil];
    } else {
        
    }
}


- (void)changeNickname {
    [[TabBarTool Share_TabBarTool]configisLoginv:self];
    self.textV.placeholdstr = @"请输入用户名";
    [self.textV Keyboardbounceshow];
}


- (void)configChangeIMG:(UIImage *)IMG {
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"正在提交，请稍后" AndView:self.view AndMode:MBProgressHUDModeIndeterminate AndImage:@"NONONO" AndBack:nil];
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:IMG forKey:@"img"];
    [self configDataforNewnetWorkname:changeAvatarMARK params:dic networkClass:[HomeAPI class]];
}


#pragma mark 公开方法

- (void)configSuccessTankuang:(NSString *)mark {
    [[FTT_HudTool share_FTT_HudTool]dissmiss];
    NSString *STR = @"修改成功";
    if ([mark isEqualToString:changeNickNameMARK]) {
        NSDictionary *user = TakeOut(@"user");
        self.nickname_LAB.text = user[@"nickName"];
    }else if ([mark isEqualToString:changeAvatarMARK]) {
        NSDictionary *user = TakeOut(@"user");
        [self.header_IMG setImageWithURL:[NSURL URLWithString:user[@"avatar"]]
                             placeholder:[UIImage imageNamed:@"NONONO"]
                                 options:YYWebImageOptionProgressive
                                 manager:[Create_Tool ImageManager]
                                progress:nil
                               transform:nil
                              completion:nil];
    }
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:STR AndView:self.view AndMode:MBProgressHUDModeText AndImage:@"NONONO" AndAfterDelay:1 AndBack:nil];
}

- (void)configFailTankuang:(NSString *)mark {
    
    [[FTT_HudTool share_FTT_HudTool]dissmiss];
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"请求失败，请重试" AndView:self.view AndMode:MBProgressHUDModeText AndImage:@"NONONO" AndAfterDelay:1 AndBack:nil];
}

#pragma mark 私有方法

- (void)tt_addSubviews {
    NSDictionary *user = TakeOut(@"user");
    [self setupVM:[HomeVM class]];
    [self.header_IMG setImageWithURL:[NSURL URLWithString:user[@"avatar"]]
                     placeholder:[UIImage imageNamed:@"NONONO"]
                         options:YYWebImageOptionProgressive
                         manager:[Create_Tool ImageManager]
                        progress:nil
                       transform:nil
                      completion:nil];
    
    self.nickname_LAB.text = user[@"nickName"];
    self.header_IMG.layer.cornerRadius = 25;
    self.header_IMG.layer.masksToBounds = YES;
    
    self.nickname_LAB.userInteractionEnabled = YES;
    self.header_IMG.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeheaderIMG)];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeNickname)];
    
    [self.nickname_LAB addGestureRecognizer:tap1];
    [self.header_IMG addGestureRecognizer:tap];
}




#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (@available(iOS 9, *)) {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
        
    }
    return _imagePickerVc;
}

- (TT_TextV *)textV {
    if (!_textV) {
        _textV = [[TT_TextV alloc]init];
        _textV.TT_deldgate = self;
    }
    return _textV;
}


@end
