//
//  City.swift
//  WeatherApp
//
//  Created by kaori hirata on 2017-09-19.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class City: NSObject {
    let cityName:String!
    var WeatherInfo:String!
    
    init(cityName:String) {
        self.cityName = cityName
    }
}
