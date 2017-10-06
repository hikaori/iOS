//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Derrick Park on 2017-10-06.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let ison = UserDefaults.standard.value(forKey: "isOn") {
            if ison as! Bool {
                mySwitch.setOn(true, animated: true)
                view.backgroundColor = UIColor.blue
            } else {
                mySwitch.setOn(false, animated: true)
                view.backgroundColor = UIColor.orange
            }
        }
    }
    @IBAction func switchTapped(_ sender: Any) {
        if (mySwitch.isOn) {
            view.backgroundColor = UIColor.blue
            mySwitch.setOn(true, animated: true)
            UserDefaults.standard.set(true, forKey: "isOn")
        } else {
            view.backgroundColor = UIColor.orange
            mySwitch.setOn(false, animated: false)
            UserDefaults.standard.set(false, forKey: "isOn")
        }
        
    }
}

