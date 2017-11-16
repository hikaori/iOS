//
//  ViewController.swift
//  Assignment7(MyScrollView)
//
//  Created by kaori hirata on 2017-10-16.
//  Copyright © 2017 kaori hirata. All rights reserved.
//  1.how to move 'frameView's origin y
//  2.how to connect 'MyScrollView.swift'

import UIKit

class ViewController: UIViewController {
    let frameView:UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the area which will show
        let frameView = UIView(frame: self.view.bounds)
        frameView.backgroundColor = UIColor.gray
        view.addSubview(frameView)
        
        // red square
        let red = CGRect(x: 20, y: 20, width: 100, height: 100)
        let redView = UIView(frame: red)
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
        
        // green square
        let green = CGRect(x: 150, y: 150, width: 150, height: 200)
        let greenView = UIView(frame: green)
        greenView.backgroundColor = UIColor.green
        view.addSubview(greenView)
        
        // blue square
        let blue = CGRect(x: 40, y: 400, width: 200, height: 150)
        let blueView = UIView(frame: blue)
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)
        
        // yellow square
        let yellow = CGRect(x: 100, y: 600, width: 180, height: 150)
        let yellowView = UIView(frame: yellow)
        yellowView.backgroundColor = UIColor.yellow
        view.addSubview(yellowView)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        frameView.bounds.origin.y = 100
        view.bounds.origin.y = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

