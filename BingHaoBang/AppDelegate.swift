//
//  AppDelegate.swift
//  BingHaoBang
//
//  Created by zhangjidong on 16/3/31.
//  Copyright © 2016年 Zjdboy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //创建窗口
        window = UIWindow(frame: SCREEN_BOUNDS)

        // 得到当前应用的版本号
        let infoDictionary = NSBundle.mainBundle().infoDictionary
        let currentAppVersion = infoDictionary!["CFBundleShortVersionString"] as! String
        
        // 取出之前保存的版本号
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let appVersion = userDefaults.stringForKey("appVersion")
        
        //判断APP是否第一次启动,每版本是否第一次启动
        if appVersion == nil || appVersion != currentAppVersion
        {
            //引导图
            self.window?.rootViewController = GuideViewController()
            // 保存最新的版本号
            userDefaults.setValue(currentAppVersion, forKey: "appVersion")
        }else{
            //创建根视图
            self.window?.rootViewController = MainTabBarController()
        }
        
        //显示窗口
        window?.makeKeyAndVisible()
        
        //FPS
        let fpslabel = FPSLabel(frame: CGRectMake(50, 30, 55, 20))
        self.window?.addSubview(fpslabel)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

