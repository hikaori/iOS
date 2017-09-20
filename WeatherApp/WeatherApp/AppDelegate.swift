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
        
        window?.rootViewController = ViewController()
        
        window?.makeKeyAndVisible()
        return true
    }
    
    var city1 = City.init(cityName: "vancouver")
    var city2 = City.init(cityName: "tokyo")
    var city3 = City.init(cityName: "rio")
    var city4 = City.init(cityName: "warszawa")
    
    let tabBarController = [[UITabBarController alloc] init]
    
    var cityViewController1 = CityViewController.init(city: city1)
    
}

