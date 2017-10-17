//
//  ViewController.swift
//  Assignment8
//
//  Created by kaori hirata on 2017-10-16.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate=self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

