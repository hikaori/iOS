//
//  ViewController.swift
//  Assignment7(MyScrollView)
//
//  Created by kaori hirata on 2017-10-16.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstFrame = CGRect(x: 0, y: 0, width: 300, height: 200)
        let frameView = UIView(frame: firstFrame)
        frameView.backgroundColor = UIColor.gray
        view.addSubview(frameView)
        
        let red = CGRect(x: 20, y: 20, width: 100, height: 100)
        let redView = UIView(frame: red)
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
        
        let green = CGRect(x: 150, y: 150, width: 150, height: 200)
        let greenView = UIView(frame: green)
        greenView.backgroundColor = UIColor.green
        view.addSubview(greenView)
        
        let blue = CGRect(x: 40, y: 400, width: 200, height: 150)
        let blueView = UIView(frame: blue)
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)

        let yellow = CGRect(x: 100, y: 600, width: 180, height: 150)
        let yellowView = UIView(frame: yellow)
        yellowView.backgroundColor = UIColor.yellow
        view.addSubview(yellowView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

