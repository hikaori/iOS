//
//  CityViewController.swift
//  testTab
//
//  Created by kaori hirata on 2017-09-21.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
//    var detailedViewController : DetailedViewController!
    var city: City!
   
    
//    convenience init(city: City) {
//        self.init(nibName: nil, bundle: nil)
//        self.city = city
//        
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: city.weather)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: view.bounds.width / 2 - 50, y: 0, width: 100, height: 100)
        view.addSubview(imageView)
        
        let button1 = UIButton(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height / 2, width: 100, height: 50))
        button1.setTitle("more info", for: UIControlState.normal)
        button1.backgroundColor = UIColor.black
        button1.addTarget(self, action: #selector(showWeatherDetails), for: .touchUpInside)
        view.addSubview(button1)
    }
    
    func showWeatherDetails(){
//        let detailedVC = DetailedViewController()
        let detailedVC = DetailedViewController.init(weatherDetail: city.name)
        detailedVC.view.backgroundColor = UIColor.red
//        detailedVC.weatherDetail = city?.name
//        detailedVC.weatherDetail = "detailed"
        
        self.navigationController?.pushViewController(detailedVC, animated: true)
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
