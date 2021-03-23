//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = UITabBarController()
        
        let profile = UITabBarItem(title: "Profile", image:UIImage(named: "SF_person_crop_square_fill") , tag: 0)
        let feed = UITabBarItem(title: "Feed", image: UIImage(named: "SF_info_circle"), tag: 1)
        
        let profileVC = LogInViewController()
        let feedVC = FeedViewController()
        profileVC.tabBarItem = profile
        feedVC.tabBarItem = feed
        
        vc.viewControllers = [UINavigationController(rootViewController: profileVC), UINavigationController(rootViewController: feedVC)]
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("applicationWillResignActive")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackground")
    }
}

