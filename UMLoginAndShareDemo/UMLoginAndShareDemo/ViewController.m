//
//  ViewController.m
//  UMLoginAndShareDemo
//
//  Created by 党玉华 on 2018/11/22.
//  Copyright © 2018年 dyh. All rights reserved.
//

#import "ViewController.h"
#import "QuickCreate.h"
#import "UMShareManege.h"

#define btnX 100
#define btnY 100

#define btnW 100
#define btnH 38
/** 屏幕高度 */
#define ScreenH [UIScreen mainScreen].bounds.size.height
/** 屏幕宽度 */
#define ScreenW [UIScreen mainScreen].bounds.size.width
//CGRectMake
#define Frame(x,y,w,h) CGRectMake(x, y, w, h)
//CGSizeMake
#define Size(w,h) CGSizeMake(w, h)
//UIEdgeInsetsMake
#define Edge(top,left,bottom,right)  UIEdgeInsetsMake(top, left, bottom, right)
//Nav高度
#define kNaviBarHeight 44
//状态栏高度
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
//导航栏高度
#define kTopBarHeight (kStatusBarHeight+kNaviBarHeight)
//高效率的NSLog
#ifdef DEBUG
#define DLog(...) NSLog(@"\n%s \n⚠️第%d行⚠️ \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define DLog(...)
#endif


#define Title @"分享标题"
#define Content @"分享的内容的描述"
#define Picture @"defaultImage"
#define WebUrl @"https://www.jianshu.com/u/e5cc61571b23"
#define RPicture @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2890920508,4158902605&fm=27&gp=0.jpg"
#define videourl @"http://video.sina.com.cn/p/ent/2018-11-23/detail-ihmutuec2836468.d.html?cre=videopagepc&mod=g&loc=4&r=0&doct=0&rfunc=28&tj=none"
#define musicurl @"https://i.y.qq.com/v8/playsong.html?songid=208662441&source=yqq#wechat_redirect"

@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollview = [QuickCreate UIScrollViewWithFrame:CGRectMake(0, 0, ScreenW, ScreenH) backgroundColor:[UIColor whiteColor] size:CGSizeMake(800, ScreenH-kTopBarHeight) isPagingEnable:NO isBounces:NO scrollEnabled:YES isShowVerticalIndicator:NO isShowsHorizontalScrollIndicator:NO];
    [self.view addSubview:self.scrollview];
    self.scrollview = [QuickCreate UIScrollViewConflictWithVCBack:self.scrollview vc:self];
    //    self.scrollview.delegate = self;
    //文本
    for (int i=0; i<5; i++) {
        UIButton *button = [QuickCreate UIButtonWithFrame:CGRectMake(0, btnY*(i+1), btnW, btnH) backgroundColor:[UIColor clearColor] title:[NSString stringWithFormat:@"%@",@[@"文本:QQ",@"QQ空间",@"微信",@"朋友圈",@"微博"][i]] image:nil selectImage:nil font:15 textColor:[UIColor blueColor] selectTextColor:[UIColor blueColor] edgeInsets:Edge(0, 0, 0, 0) tag:i+1 target:self action:@selector(textButton:)];
        [self.scrollview addSubview:button];
    }
    //图片
    for (int i=0; i<5; i++) {
        UIButton *button = [QuickCreate UIButtonWithFrame:CGRectMake(btnX, btnY*(i+1), btnW, btnH) backgroundColor:[UIColor clearColor] title:[NSString stringWithFormat:@"%@",@[@"图片:QQ",@"QQ空间",@"微信",@"朋友圈",@"微博"][i]] image:nil selectImage:nil font:15 textColor: [UIColor blueColor] selectTextColor:[UIColor blueColor] edgeInsets:Edge(0, 0, 0, 0) tag:i+1 target:self action:@selector(picButton:)];
        [self.scrollview addSubview:button];
    }
    //web
    for (int i=0; i<5; i++) {
        UIButton *button = [QuickCreate UIButtonWithFrame:CGRectMake(btnX*2, btnY*(i+1), btnW, btnH) backgroundColor:[UIColor clearColor] title:[NSString stringWithFormat:@"%@",@[@"web:QQ",@"QQ空间",@"微信",@"朋友圈",@"微博"][i]] image:nil selectImage:nil font:15 textColor:[UIColor blueColor] selectTextColor:[UIColor blueColor] edgeInsets:Edge(0, 0, 0, 0) tag:i+1 target:self action:@selector(webButton:)];
        [self.scrollview addSubview:button];
    }
    //音乐
    for (int i=0; i<5; i++) {
        UIButton *button = [QuickCreate UIButtonWithFrame:CGRectMake(btnX*3, btnY*(i+1), btnW, btnH) backgroundColor:[UIColor clearColor] title:[NSString stringWithFormat:@"%@",@[@"音乐:QQ",@"QQ空间",@"微信",@"朋友圈",@"微博"][i]] image:nil selectImage:nil font:15 textColor:[UIColor blueColor] selectTextColor:[UIColor blueColor] edgeInsets:Edge(0, 0, 0, 0) tag:i+1 target:self action:@selector(musicButton:)];
        [self.scrollview addSubview:button];
    }
    //视频
    for (int i=0; i<5; i++) {
        UIButton *button = [QuickCreate UIButtonWithFrame:CGRectMake(btnX*4, btnY*(i+1), btnW, btnH) backgroundColor:[UIColor clearColor] title:[NSString stringWithFormat:@"%@",@[@"视频:QQ",@"QQ空间",@"微信",@"朋友圈",@"微博"][i]] image:nil selectImage:nil font:15 textColor:[UIColor blueColor] selectTextColor:[UIColor blueColor] edgeInsets:Edge(0, 0, 0, 0) tag:i+1 target:self action:@selector(videoButton:)];
        [self.scrollview addSubview:button];
    }
    //登录
    for (int i=0; i<3; i++) {
        UIButton *button = [QuickCreate UIButtonWithFrame:CGRectMake(btnX*5, btnY*(i+1), btnW, btnH) backgroundColor:[UIColor clearColor] title:[NSString stringWithFormat:@"%@",@[@"登录:QQ",@"微信",@"微博"][i]] image:nil selectImage:nil font:15 textColor:[UIColor blueColor] selectTextColor:[UIColor blueColor] edgeInsets:Edge(0, 0, 0, 0) tag:i+1 target:self action:@selector(loginButton:)];
        [self.scrollview addSubview:button];
        if (i==2) {
            self.scrollview.contentSize = Size(btnX*5+btnW, ScreenH-kTopBarHeight);
        }
    }
}

-(void)textButton:(UIButton *)send{
    switch (send.tag) {
        case 1:{
            [UMShareManege TextSharePlatform:UMSocialPlatformType_QQ content:Content viewControl:self succeed:^(id data) {
                UMSocialShareResponse *resp = data;
                DLog(@"%@",resp.message);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 2:{
            [UMShareManege TextSharePlatform:UMSocialPlatformType_Qzone content:Content viewControl:self succeed:^(id data) {
                UMSocialShareResponse *resp = data;
                DLog(@"%@",resp.message);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 3:{
            [UMShareManege TextSharePlatform:UMSocialPlatformType_WechatSession content:Content viewControl:self succeed:^(id data) {
                UMSocialShareResponse *resp = data;
                DLog(@"%@",resp.message);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 4:{
            [UMShareManege TextSharePlatform:UMSocialPlatformType_WechatTimeLine content:Content viewControl:self succeed:^(id data) {
                UMSocialShareResponse *resp = data;
                DLog(@"%@",resp.message);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 5:{
            [UMShareManege TextSharePlatform:UMSocialPlatformType_Sina content:Content viewControl:self succeed:^(id data) {
                UMSocialShareResponse *resp = data;
                DLog(@"%@",resp.message);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        default:
            break;
    }
}
- (void)picButton:(UIButton *)send{
    switch (send.tag) {
        case 1:{
            [UMShareManege PictureSharePlatform:UMSocialPlatformType_QQ thumbImage:Picture picture:RPicture viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 2:{
            [UMShareManege PictureSharePlatform:UMSocialPlatformType_Qzone thumbImage:Picture picture:RPicture viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 3:{
            [UMShareManege PictureSharePlatform:UMSocialPlatformType_WechatSession thumbImage:Picture picture:RPicture viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 4:{
            [UMShareManege PictureSharePlatform:UMSocialPlatformType_WechatTimeLine thumbImage:Picture picture:RPicture viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 5:{
            [UMShareManege PictureSharePlatform:UMSocialPlatformType_Sina thumbImage:Picture picture:RPicture viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        default:
            break;
    }
}

- (void)webButton:(UIButton *)send{
    switch (send.tag) {
        case 1:{
            [UMShareManege WebSharePlatform:UMSocialPlatformType_QQ title:Title content:Content picture:Picture webUrl:WebUrl viewControl:self succeed:^(id data) {
                DLog(@"response data is %@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 2:{
            [UMShareManege WebSharePlatform:UMSocialPlatformType_Qzone title:Title content:Content picture:Picture webUrl:WebUrl viewControl:self succeed:^(id data) {
                DLog(@"response data is %@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 3:{
            [UMShareManege WebSharePlatform:UMSocialPlatformType_WechatSession title:Title content:Content picture:Picture webUrl:WebUrl viewControl:self succeed:^(id data) {
                DLog(@"response data is %@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 4:{
            [UMShareManege WebSharePlatform:UMSocialPlatformType_WechatTimeLine title:Title content:Content picture:Picture webUrl:WebUrl viewControl:self succeed:^(id data) {
                DLog(@"response data is %@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 5:{
            [UMShareManege WebSharePlatform:UMSocialPlatformType_Sina title:Title content:Content picture:Picture webUrl:WebUrl viewControl:self succeed:^(id data) {
                DLog(@"response data is %@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        default:
            break;
    }
}
- (void)musicButton:(UIButton *)send{
    switch (send.tag) {
        case 1:{
            [UMShareManege MusicSharePlatform:UMSocialPlatformType_QQ title:Title content:Content picture:Picture musicUrl:musicurl viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 2:{
            [UMShareManege MusicSharePlatform:UMSocialPlatformType_Qzone title:Title content:Content picture:Picture musicUrl:musicurl viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 3:{
            [UMShareManege MusicSharePlatform:UMSocialPlatformType_WechatSession title:Title content:Content picture:Picture musicUrl:musicurl viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 4:{
            [UMShareManege MusicSharePlatform:UMSocialPlatformType_WechatTimeLine title:Title content:Content picture:Picture musicUrl:musicurl viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        case 5:{
            [UMShareManege MusicSharePlatform:UMSocialPlatformType_Sina title:Title content:Content picture:Picture musicUrl:musicurl viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"%@",error);
            }];
        }
            break;
        default:
            break;
    }
}
- (void)videoButton:(UIButton *)send{
    switch (send.tag) {
        case 1:{
            [UMShareManege VideoSharePlatform:UMSocialPlatformType_QQ title:Title content:Content picture:Picture videoUrl:videourl viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"************Share fail with error %@*********",error);
            }];
        }
            break;
        case 2:{
            [UMShareManege VideoSharePlatform:UMSocialPlatformType_Qzone title:Title content:Content picture:Picture videoUrl:videourl viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"************Share fail with error %@*********",error);
            }];
        }
            break;
        case 3:{
            [UMShareManege VideoSharePlatform:UMSocialPlatformType_WechatSession title:Title content:Content picture:Picture videoUrl:videourl viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"************Share fail with error %@*********",error);
            }];
        }
            break;
        case 4:{
            [UMShareManege VideoSharePlatform:UMSocialPlatformType_WechatTimeLine title:Title content:Content picture:Picture videoUrl:videourl viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"************Share fail with error %@*********",error);
            }];
        }
            break;
        case 5:{
            [UMShareManege VideoSharePlatform:UMSocialPlatformType_Sina title:Title content:Content picture:Picture videoUrl:videourl viewControl:self succeed:^(id data) {
                DLog(@"%@",data);
            } failure:^(NSError *error) {
                DLog(@"************Share fail with error %@*********",error);
            }];
        }
            break;
        default:
            break;
    }
}

- (void)loginButton:(UIButton *)send{
    switch (send.tag) {
        case 1:{
            [UMShareManege LoginPlatform:UMSocialPlatformType_QQ viewControl:self succeed:^(id data) {
                
                UMSocialUserInfoResponse *resp = data;
                // 授权信息
                DLog(@"QQ uid: %@", resp.uid);
                DLog(@"QQ openid: %@", resp.openid);
                DLog(@"QQ unionid: %@", resp.uid);
                DLog(@"QQ accessToken: %@", resp.accessToken);
                DLog(@"QQ expiration: %@", resp.expiration);
                // 用户信息
                DLog(@"QQ name: %@", resp.name);
                DLog(@"QQ iconurl: %@", resp.iconurl);
                DLog(@"QQ gender: %@", resp.unionGender);
                // 第三方平台SDK源数据
                DLog(@"QQ originalResponse: %@", resp.originalResponse);
                
            } failure:^(NSError *error) {
                DLog(@"%@",error.localizedDescription);
            }];
        }
            break;
        case 2:{
            [UMShareManege LoginPlatform:UMSocialPlatformType_WechatSession viewControl:self succeed:^(id data) {
                UMSocialUserInfoResponse *resp = data;
                // 授权信息
                DLog(@"Wechat uid: %@", resp.uid);
                DLog(@"Wechat openid: %@", resp.openid);
                DLog(@"Wechat unionid: %@", resp.uid);
                DLog(@"Wechat accessToken: %@", resp.accessToken);
                DLog(@"Wechat refreshToken: %@", resp.refreshToken);
                DLog(@"Wechat expiration: %@", resp.expiration);
                // 用户信息
                DLog(@"Wechat name: %@", resp.name);
                DLog(@"Wechat iconurl: %@", resp.iconurl);
                DLog(@"Wechat gender: %@", resp.unionGender);
                // 第三方平台SDK源数据
                DLog(@"Wechat originalResponse: %@", resp.originalResponse);
            } failure:^(NSError *error) {
                DLog(@"%@",error.localizedDescription);
            }];
        }
            break;
        case 3:{
            [UMShareManege LoginPlatform:UMSocialPlatformType_Sina viewControl:self succeed:^(id data) {
                
                UMSocialUserInfoResponse *resp = data;
                // 授权信息
                DLog(@"Sina uid: %@", resp.uid);
                DLog(@"Sina accessToken: %@", resp.accessToken);
                DLog(@"Sina refreshToken: %@", resp.refreshToken);
                DLog(@"Sina expiration: %@", resp.expiration);
                // 用户信息
                DLog(@"Sina name: %@", resp.name);
                DLog(@"Sina iconurl: %@", resp.iconurl);
                DLog(@"Sina gender: %@", resp.unionGender);
                // 第三方平台SDK源数据
                DLog(@"Sina originalResponse: %@", resp.originalResponse);
                
            } failure:^(NSError *error) {
                DLog(@"%@",error.localizedDescription);
            }];
        }
            break;
        default:
            break;
    }
}


@end
