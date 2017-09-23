//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Derrick Park on 2017-05-26.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
//        let vancouver = City()
//        let tokyo = City()
//        let rio = City()
//        let warszawa = City()
//        let sydny = City()
        
        
        
        let tabBarController = UITabBarController()
        
//        window?.rootViewController = ViewController()
        window?.rootViewController = tabBarController
        
        window?.makeKeyAndVisible()
        return true
        
        let city0VC = CityViewController()
            city0VC.title = "vancouver"
        let city1VC = CityViewController()
            city1VC.title = "tokyo"
        let city2VC = CityViewController()
            city2VC.title = "rio"
        let city3VC = CityViewController()
            city3VC.title = "warszawa"
        let city4VC = CityViewController()
            city4VC.title = "sydny"
        
        city0VC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        city1VC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        city2VC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        city3VC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 3)
        city4VC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 4)
        
        let controllers = [city0VC, city1VC, city2VC, city3VC, city4VC]
        
        tabBarController.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        
//        let DetailedViewController = ViewController()
        
        
//        UIViewController *myViewController = [[MyViewController alloc] init];
//        navigationController = [[UINavigationController alloc]
//        initWithRootViewController:myViewController];
//        let myViewController = ViewController()
//        let navigationController = UINavigationController(rootViewController: myViewController)
        
//        let city0NavC = UINavigationController(rootViewController: city0VC)
//        let city1NavC = UINavigationController(rootViewController: city1VC)
//        let city2NavC = UINavigationController(rootViewController: city2VC)
//        let city3NavC = UINavigationController(rootViewController: city3VC)
//        let city4NavC = UINavigationController(rootViewController: city4VC)
        
        
        
        
    }
    
}

