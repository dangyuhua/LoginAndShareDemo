//
//  UMShareManege.h
//  shareModule
//
//  Created by 党玉华 on 2018/6/21.
//  Copyright © 2018年 党玉华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMShare/UMShare.h>

//官方文档 https://developer.umeng.com/docs/66632/detail/66825#h1-u-share-3

@interface UMShareManege : NSObject

//设置各平台appKey和appSecret
+(void)setPlaform:(UMSocialPlatformType )platformType appKey:(NSString *)appKey appSecret:(NSString *)appSecret redirectURL:(NSString *)redirectURL;

//登录
+(void)LoginPlatform:(UMSocialPlatformType )platformType viewControl:(UIViewController *)vc succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

//分享文本
+(void)TextSharePlatform:(UMSocialPlatformType )platformType content:(NSString *)description viewControl:(UIViewController *)vc succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

//分享图片
+(void)PictureSharePlatform:(UMSocialPlatformType )platformType thumbImage:(NSString *)thumbImageName  picture:(NSString *)imageName viewControl:(UIViewController *)vc succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

//分享网页
+(void)WebSharePlatform:(UMSocialPlatformType )platformType title:(NSString *)title content:(NSString *)description picture:(NSString *)imageName webUrl:(NSString *)url viewControl:(UIViewController *)vc succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

//分享音乐
+(void)MusicSharePlatform:(UMSocialPlatformType )platformType title:(NSString *)title content:(NSString *)description picture:(NSString *)imageName musicUrl:(NSString *)url viewControl:(UIViewController *)vc succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

//分享视频
+(void)VideoSharePlatform:(UMSocialPlatformType )platformType title:(NSString *)title content:(NSString *)description picture:(NSString *)imageName videoUrl:(NSString *)url viewControl:(UIViewController *)vc succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

@end
