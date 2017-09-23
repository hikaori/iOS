//
//  AppDelegate.swift
//  testTab
//
//  Created by kaori hirata on 2017-09-20.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vancouver = City(weather: "rain.png",name:"vancouver")
        let tokyo = City(weather: "rain.png",name:"tokyo")
        let rio = City(weather: "rain.png",name:"rio")
        let warsaw = City(weather: "rain.png",name:"warsaw")
        let sydny = City(weather: "rain.png",name:"sydny")
//
        
        
        let tabBarController = UITabBarController()
        
        // creating each view(page)
        let vancouverVC = CityViewController()
        vancouverVC.city = vancouver
        vancouverVC.title = "Vancouver"
        vancouverVC.view.backgroundColor = UIColor.orange
        
        let tokyoVC = CityViewController()
        tokyoVC.city = tokyo
        tokyoVC.title = "Tokyo"
        tokyoVC.view.backgroundColor = UIColor.orange
        

        let rioVC = CityViewController()
        rioVC.city = rio
        rioVC.title = "Rio"
        rioVC.view.backgroundColor = UIColor.blue

        let warsawVC = CityViewController()
        warsawVC.city = warsaw
        warsawVC.title = "Warsaw"
        warsawVC.view.backgroundColor = UIColor.orange
        
        let sydnyVC = CityViewController()
        sydnyVC.city = sydny
        sydnyVC.title = "Sydny"
        sydnyVC.view.backgroundColor = UIColor.blue
        
        // adding tab to view
        vancouverVC.tabBarItem = UITabBarItem(title: "vancouver", image: UIImage(named: "vancouver.png"), tag: 0)
        tokyoVC.tabBarItem = UITabBarItem(title: "Tokyo", image: UIImage(named: "vancouver.png"), tag: 1)
        rioVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
        warsawVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 3)
        sydnyVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 4)

        
//         // this is short way to code of *1
//        let controllers = [vancouverVC, tokyoVC,rioVC,warsawVC,sydnyVC]
//
//        tabBarController.viewControllers = controllers.map {
//            UINavigationController(rootViewController: $0)
//        }
 
        //    *1　↓　　add Navigation(title) to created view which has view selef and tab. conected those to rootViewController(tabBarController which is fast View of this app)
        let vancouverNavC = UINavigationController.init(rootViewController: vancouverVC)
        let tokyoNavC = UINavigationController.init(rootViewController: tokyoVC)
        let rioNavC = UINavigationController.init(rootViewController: rioVC)
        let warsawNavC = UINavigationController.init(rootViewController: warsawVC)
        let sydnyNavC = UINavigationController.init(rootViewController: sydnyVC)
        
        let controllers = [vancouverNavC, tokyoNavC,rioNavC,warsawNavC,sydnyNavC]
        tabBarController.viewControllers = controllers
        //     *1 ↑
        
        
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

