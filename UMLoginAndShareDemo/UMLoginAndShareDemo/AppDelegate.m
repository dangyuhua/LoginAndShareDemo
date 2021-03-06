//
//  AppDelegate.m
//  UMLoginAndShareDemo
//
//  Created by 党玉华 on 2018/11/22.
//  Copyright © 2018年 dyh. All rights reserved.
//

#import "AppDelegate.h"
#import <UMShare/UMShare.h>
#import <UMCommon/UMCommon.h>
#import "UMShareManege.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#define UMKEY @"5bf77bb3b465f5ec3000007e"
#define WeChatAPPKEY @"wx617c77c82218ea2c"
#define WeChatSecret @"c7253e5289986cf4c4c74d1ccc185fb1"
#define QQAPPKEY @"100371282"
#define QQSecret @"aed9b0303e3ed1e27bae87c33761161d"
#define SinaAPPKEY @"568898243"
#define SinaSecret @"38a4f8204cc784f81f9f0daaf31e02e3"
#define SinaRedirectURL @"http://www.sharesdk.cn"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //友盟
    [UMConfigure initWithAppkey:UMKEY channel:nil];
    [self initSDK];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[ViewController alloc]init];
    return YES;
}

-(void)initSDK{
    [UMShareManege setPlaform:UMSocialPlatformType_WechatSession appKey:WeChatAPPKEY appSecret:WeChatSecret redirectURL:nil];
    [UMShareManege setPlaform:UMSocialPlatformType_QQ appKey:QQAPPKEY appSecret:QQSecret redirectURL:nil];
    [UMShareManege setPlaform:UMSocialPlatformType_Sina appKey:SinaAPPKEY appSecret:SinaSecret redirectURL:SinaRedirectURL];
}

// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
