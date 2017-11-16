//
//  MyScrollView.swift
//  Assignment7(MyScrollView)
//
//  Created by kaori hirata on 2017-10-16.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class MyScrollView: UIView {
    
    var contentSize:CGSize = CGSize(width:100, height:100)
    
    let gestureRec = UIPanGestureRecognizer(target: self, action: #selector(handleGesture))

    @objc func handleGesture(gestureRec: UIPanGestureRecognizer) {
        self.bounds.origin.y = 100
    }
}
