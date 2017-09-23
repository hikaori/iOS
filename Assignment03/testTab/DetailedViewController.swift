//
//  DetailedViewController.swift
//  testTab
//
//  Created by kaori hirata on 2017-09-21.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    var weatherDetail : String!

    convenience init(weatherDetail:String) {
        self.init(nibName: nil, bundle: nil)
        self.weatherDetail = weatherDetail
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let weatherLabel = UILabel(frame: .init(x: view.bounds.width/2 - 50, y: view.bounds.height / 2, width: 50, height: 50))
        weatherLabel.textColor = UIColor.white
        
        weatherLabel.text = weatherDetail
        
        
        view.addSubview(weatherLabel)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
