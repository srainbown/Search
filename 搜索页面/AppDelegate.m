//
//  AppDelegate.m
//  搜索页面
//
//  Created by 李自杨 on 2017/5/9.
//  Copyright © 2017年 View. All rights reserved.
//

#import "AppDelegate.h"
#import "SearchViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    
    SearchViewController *vc = [[SearchViewController alloc]init];
    
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    
    self.window.rootViewController = navi;
    
    return YES;
}


@end
