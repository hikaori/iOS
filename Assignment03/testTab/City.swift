//
//  City.swift
//  testTab
//
//  Created by kaori hirata on 2017-09-21.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class City: NSObject {
    var weather: String
    var name:String
    init(weather: String,name:String) {
        self.weather = weather
        self.name = name
    }
    
}
