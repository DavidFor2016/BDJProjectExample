//
//  AppDelegate.m
//  百思不得姐
//
//  Created by 付星 on 2016/11/9.
//  Copyright © 2016年 yizzuide. All rights reserved.
//

#import "AppDelegate.h"
#import "XFLegoVIPER.h"
#import "BDJAppURLRegister.h"
#import "BDJAPPLoader.h"
#import "LEMVVMModuleHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // 配置乐高框架
    [[[XFLegoConfig defaultConfig] // 使有默认配置
                    enableLog] // 允许打印log
                    addComponentHanderPlug:[LEMVVMModuleHandler class]]; // 添加扩展MVVM模块组件处理器（用来处理MVVM模块组件）
    
    // 注册APP的所有URL
    [BDJAppURLRegister urlRegister];
    
    // 根据URL显示组件(注意：这里一定要可以用使用self.window，不然当前宏不可用！)
    XF_ShowURLComponent2Window_Fast(@"bdj://indexTab")
    
    // 启动加载器
    [BDJAPPLoader loadForWindow:self.window];
    
    return YES;
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
