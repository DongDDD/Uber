//
//  AppDelegate.swift
//  Uber
//
//  Created by jobs on 16/1/25.
//  Copyright © 2016年 jobs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        if isiPhone5() {
//            FxLog("Startup:iPhone5")
//        }
        self.showGuidePage()
        return true
    }
    
    func showGuidePage(){
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let page = UIStoryboard(name: "GuidePage", bundle: nil).instantiateViewControllerWithIdentifier("Guide")
        self.window?.rootViewController = page
         self.window?.makeKeyAndVisible()
    }

    func applicationWillResignActive(application: UIApplication) {
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        
    }
    

    func applicationWillTerminate(application: UIApplication) {
        
    }


}

