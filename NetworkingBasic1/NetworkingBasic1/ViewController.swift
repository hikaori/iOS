//
//  ViewController.swift
//  NetworkingBasic1
//
//  Created by Derrick Park on 2017-10-18.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iPhoneImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://i.imgur.com/bktnImE.png")!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let downloadTask = session.downloadTask(with: url) { (location, response, error) in
            if (error != nil) {
                print("Error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let loc = location else { return }
            print(loc)
            guard let data = try? Data(contentsOf: loc) else { return }
            let image = UIImage(data: data)
           
            DispatchQueue.main.async {
                self.iPhoneImageView.image = image
            }
            
//            do {
//                let data = try Data(contentsOf: loc)
//                let image = UIImage(data: data)
//
//                DispatchQueue.main.async {
//                    self.iPhoneImageView.image = image
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
            
        }
        downloadTask.resume()
        
    }

}

