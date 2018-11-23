//
//  UMShareManege.m
//  shareModule
//
//  Created by 党玉华 on 2018/6/21.
//  Copyright © 2018年 党玉华. All rights reserved.
//

#import "UMShareManege.h"

@implementation UMShareManege
//设置各平台appKey和appSecret
+(void)setPlaform:(UMSocialPlatformType )platformType appKey:(NSString *)appKey appSecret:(NSString *)appSecret redirectURL:(NSString *)redirectURL{
    [[UMSocialManager defaultManager]setPlaform:platformType appKey:appKey appSecret:appSecret redirectURL:redirectURL];
}

//登录
+(void)LoginPlatform:(UMSocialPlatformType )platformType viewControl:(UIViewController *)vc succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure{
    
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:vc completion:^(id result, NSError *error) {
        if (error) {
            failure(error);
        } else {
            succeed(result);
        }
    }];
}
//分享文本
+(void)TextSharePlatform:(UMSocialPlatformType )platformType content:(NSString *)description viewControl:(UIViewController *)vc succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure{
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = @"社会化组件UShare将各大社交平台接入您的应用，快速武装App。";
    
    /**
     设置分享
     @param data 分享返回信息
     @param error 失败信息
     @param UMSocialPlatformType 分享平台
     */
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:vc completion:^(id data, NSError *error) {
        if (error) {
            failure(error);
        }else{
            succeed(data);
        }
    }];
}
//分享图片
+(void)PictureSharePlatform:(UMSocialPlatformType )platformType thumbImage:(NSString *)thumbImageName picture:(NSString *)imageName viewControl:(UIViewController *)vc succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure{
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = [UIImage imageNamed:thumbImageName];
    [shareObject setShareImage:imageName];
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:vc completion:^(id data, NSError *error) {
        if (error) {
            failure(error);
        }else{
            succeed(data);
        }
    }];
}

//分享网页
+(void)WebSharePlatform:(UMSocialPlatformType )platformType title:(NSString *)title content:(NSString *)description picture:(NSString *)imageName webUrl:(NSString *)url viewControl:(UIViewController *)vc succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure{
    /*
     创建网页内容对象
     根据不同需求设置不同分享内容，一般为图片，标题，描述，url
     */
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:description thumImage:[UIImage imageNamed:imageName]];
    
    //设置网页地址
    shareObject.webpageUrl = url;
    
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    /**
     设置分享
     @param data 分享返回信息
     @param error 失败信息
     @param UMSocialPlatformType 分享平台
     */
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:vc completion:^(id data, NSError *error) {
        if (error) {
            failure(error);
        }else{
            succeed(data);
        }
    }];
}
//分享音乐
+(void)MusicSharePlatform:(UMSocialPlatformType )platformType title:(NSString *)title content:(NSString *)description picture:(NSString *)imageName musicUrl:(NSString *)url viewControl:(UIViewController *)vc succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure{
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建音乐内容对象
    UMShareMusicObject *shareObject = [UMShareMusicObject shareObjectWithTitle:title descr:description thumImage:[UIImage imageNamed:imageName]];
    //设置音乐网页播放地址
    shareObject.musicUrl = url;
    //            shareObject.musicDataUrl = @"这里设置音乐数据流地址（如果有的话，而且也要看所分享的平台支不支持）";
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:vc completion:^(id data, NSError *error) {
        if (error) {
            failure(error);
        }else{
            succeed(data);
        }
    }];
}
//分享视频
+(void)VideoSharePlatform:(UMSocialPlatformType )platformType title:(NSString *)title content:(NSString *)description picture:(NSString *)imageName videoUrl:(NSString *)url viewControl:(UIViewController *)vc succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure{
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建视频内容对象
    UMShareVideoObject *shareObject = [UMShareVideoObject shareObjectWithTitle:title descr:description thumImage:[UIImage imageNamed:imageName]];
    //设置视频网页播放地址
    shareObject.videoUrl = url;
    //shareObject.videoStreamUrl = @"这里设置视频数据流地址（如果有的话，而且也要看所分享的平台支不支持）";
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:vc completion:^(id data, NSError *error) {
        if (error) {
            failure(error);
        }else{
            succeed(data);
        }
    }];
}


@end
