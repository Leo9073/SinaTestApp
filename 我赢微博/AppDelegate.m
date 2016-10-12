//
//  AppDelegate.m
//  我赢微博
//
//  Created by Leo on 10/10/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "AppDelegate.h"
#import "WYTabBarController.h"
#import "WYNewFeatureViewController.h"
#import "WYOAuthViewController.h"
#import "WYAccountTool.h"
#import "WYAccount.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //1、创建主窗口
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    WYAccount *account = [WYAccountTool account];
    if (account) { //如果账号存在，说明已经登录过
        //获取沙盒路径document
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        path = [path stringByAppendingPathComponent:@"version.plist"];
        //获取当前应用程序的版本号
        NSDictionary *dict = [NSBundle mainBundle].infoDictionary;
        NSString *currentVersion = dict[@"CFBundleVersion"];
        NSMutableDictionary *oldVersionDict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
        if (oldVersionDict) { //文件存在，则不是第一次安装
            NSString *oldVersion = oldVersionDict[@"CFBundleVersion"];
            if (![currentVersion isEqualToString:oldVersion]) {
                //如果两个版本号不相同，则显示新特性
                WYNewFeatureViewController *rootVC = [[WYNewFeatureViewController alloc]init];
                _window.rootViewController = rootVC;
                //保存当前的版本
                oldVersionDict[@"CFBundleVersion"] = currentVersion;
                [oldVersionDict writeToFile:path atomically:YES];
            } else {
                //否则直接显示主窗口
                WYTabBarController *rootVC = [[WYTabBarController alloc]init];
                _window.rootViewController = rootVC;
            }
        } else { //第一次安装，需要显示新特性，并保存版本号
            WYNewFeatureViewController *rootVC = [[WYNewFeatureViewController alloc]init];
            _window.rootViewController = rootVC;
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            dict[@"CFBundleVersion"] = currentVersion;
            [dict writeToFile:path atomically:YES];
        }
    } else { //没有登录过，到授权页面，同时需要显示新特性
        //将授权页面设置为根控制器
        WYOAuthViewController *rootViewController = [[WYOAuthViewController alloc]init];
        _window.rootViewController = rootViewController;
    }
    [_window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
