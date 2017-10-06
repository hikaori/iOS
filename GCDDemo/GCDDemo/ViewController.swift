//
//  ViewController.swift
//  GCDDemo
//
//  Created by Derrick Park on 2017-10-06.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        simpleQueues()
//        queuesWithQoS()
//        concurrentQueues()
//        queueWithDelay()
//        globalQueues()
        fetchData()
//        useWorkItem()

    }
    
    
    //change 'queue.sync' to 'queue.async' see what happen
    func simpleQueues() {
        let queue = DispatchQueue(label: "myQueue")
        queue.sync {
            for i in 0..<10 {
                print("🔴 ", i)
            }
        }
        for i in 100..<110 {
            print("🔵 ", i)
        }
    }
    /*=======================================
     none name Que = main Que
     'queue.sync' -> all red show then blue show up.
     'queue.async'-> randomly show up
     =======================================*/
    
    
    //change one of this code "qos: .userInitiated" to "qos: .background" see what happen
    func queuesWithQoS() {
        let queue1 = DispatchQueue(label: "queue1", qos: .userInitiated)
        let queue2 = DispatchQueue(label: "queue2", qos: .userInitiated)
        
        queue1.async {
            for i in 0..<10 {
                print("🔴 ", i)
            }
        }
        queue2.async {
            for i in 100..<110 {
                print("🔵 ", i)
            }
        }
        for i in 1000..<1010 {
            print("😀", i)
        }
        
    }
    /*=========================
     both "qos: .userInitiated" -> every thing randomly show up.
     one  "qos: .background"    -> most of bleu should run after red and smily
     =========================*/
    
    func concurrentQueues() {
        let anotherQueue = DispatchQueue(label: "anotherQueue", qos: .utility, attributes: .concurrent)
        anotherQueue.async {
            for i in 0..<10 {
                print("🔴 ", i)
            }
        }
        anotherQueue.async {
            for i in 100..<110 {
                print("🔵 ", i)
            }
        }
        anotherQueue.async {
            for i in 1000..<1010 {
                print("😀", i)
            }
        }
    }
    
    func queueWithDelay() {
        let delayQueue = DispatchQueue(label: "delayQueue", qos: .userInitiated)
        print(Date())
        let additionalTime: DispatchTimeInterval = .seconds(5)
        
        delayQueue.asyncAfter(deadline: .now() + additionalTime) {
            print(Date())
        }
    }
    
    func globalQueues() {
        let global = DispatchQueue.global()
        global.async {
            for i in 0..<10 {
                print("🍏", i)
            }
        }
    }
    
    
    func fetchData() {
        let url: URL = URL(string: "apple.ca")!
        (URLSession(configuration: .default).dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                print("There is an error: ", error.localizedDescription)
            }
            if let data = data {
                print("Did download the data")
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }).resume()
    }
    
    func useWorkItem() {
        var value = 10
        
        let workitem = DispatchWorkItem { value += 5 }
        workitem.perform()
        
        let queue = DispatchQueue.global()
//        queue.async {
//            workitem.perform()
//        }
        queue.async(execute: workitem)
        
        workitem.notify(queue: DispatchQueue.main) {
            print("value = ", value)
        }
    }
}











