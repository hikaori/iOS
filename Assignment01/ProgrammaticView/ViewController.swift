//
//  ViewController.swift
//  ProgrammaticView
//
//  Created by Derrick Park on 2017-05-24.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let purpleBox = UIView(frame: CGRect.zero)
    let blueBox1 = UIView(frame: CGRect.zero)
    let blueBox2 = UIView(frame: CGRect.zero)
    let blueBox3 = UIView(frame: CGRect.zero)
    let redBox = UIView(frame: CGRect.zero)
    let orangeBox1 = UIView(frame: CGRect.zero)
    let orangeBox2 = UIView(frame: CGRect.zero)
    let framingView: UIView = UIView(frame: CGRect.zero)
    let squareButton: UIButton = UIButton(type: .system)
    let portraitButton: UIButton = UIButton(type: .system)
    let landscapeButton: UIButton = UIButton(type: .system)
    var framingViewHeightConstraint: NSLayoutConstraint = NSLayoutConstraint.init()
    var framingViewWidthConstraint: NSLayoutConstraint = NSLayoutConstraint.init()
    var stackViewHeightConstraint: NSLayoutConstraint = NSLayoutConstraint.init()
    var stackViewWidthConstraint: NSLayoutConstraint = NSLayoutConstraint.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareButton.setTitle("Square", for: .normal)
        squareButton.addTarget(self, action: #selector(resizeFramingView), for: .touchUpInside)
        view.addSubview(squareButton)
        squareButton.translatesAutoresizingMaskIntoConstraints = false
        
        portraitButton.setTitle("Portrait", for: .normal)
        portraitButton.addTarget(self, action: #selector(resizeFramingView), for: .touchUpInside)
        view.addSubview(portraitButton)
        portraitButton.translatesAutoresizingMaskIntoConstraints = false
        
        landscapeButton.setTitle("Landscape", for: .normal)
        landscapeButton.addTarget(self, action: #selector(resizeFramingView), for: .touchUpInside)
        view.addSubview(landscapeButton)
        landscapeButton.translatesAutoresizingMaskIntoConstraints = false
        
        framingView.translatesAutoresizingMaskIntoConstraints = false
        framingView.backgroundColor = UIColor.green
        
        view.addSubview(framingView)
        
        let buttonsHorizontalContraintsFormat = "|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|"
        
        let buttonsHorizontalContraints = NSLayoutConstraint.constraints(withVisualFormat: buttonsHorizontalContraintsFormat, options: .alignAllCenterY, metrics: nil, views: ["squareButton":squareButton, "portraitButton":portraitButton, "landscapeButton":landscapeButton])
        
        NSLayoutConstraint.activate(buttonsHorizontalContraints)
        
        let squareButtonBottomConstraint = NSLayoutConstraint.init(item: squareButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -50.0)
        squareButtonBottomConstraint.isActive = true
        
        let framingViewCenterXContraint = NSLayoutConstraint.init(item: framingView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        
        framingViewCenterXContraint.isActive = true

        let framingViewCenterYContraint = NSLayoutConstraint.init(item: framingView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        framingViewCenterYContraint.isActive = true
        
        framingViewHeightConstraint = NSLayoutConstraint.init(item: framingView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 500.0)
        framingViewHeightConstraint.isActive = true
        
        framingViewWidthConstraint = NSLayoutConstraint.init(item: framingView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 500.0)
        framingViewWidthConstraint.isActive = true

// purple Box
        purpleBox.translatesAutoresizingMaskIntoConstraints = false
        purpleBox.backgroundColor = UIColor.purple
        view.addSubview(purpleBox)
        
        let purpleRightConstraint = NSLayoutConstraint.init(item: purpleBox, attribute: .right, relatedBy: .equal, toItem: framingView, attribute: .right, multiplier: 1.0, constant: -20)
        purpleRightConstraint.isActive = true
        
        let purpleBottomConstraint = NSLayoutConstraint.init(item: purpleBox, attribute: .bottom, relatedBy: .equal, toItem: framingView, attribute: .bottom, multiplier: 1.0, constant: -20)
        purpleBottomConstraint.isActive = true
        
        let purpleWidthConstraint = NSLayoutConstraint.init(item: purpleBox, attribute: .width, relatedBy: .equal, toItem: framingView, attribute: .width, multiplier: 305.0/500.0, constant: 0)
        purpleWidthConstraint.isActive = true
        
        let purpleHeightConstraint = NSLayoutConstraint.init(item: purpleBox, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        purpleHeightConstraint.isActive = true

// blue Box

        blueBox1.translatesAutoresizingMaskIntoConstraints = false
        blueBox1.backgroundColor = UIColor.blue
        view.addSubview(blueBox1)
        
        blueBox2.translatesAutoresizingMaskIntoConstraints = false
        blueBox2.backgroundColor = UIColor.blue
        view.addSubview(blueBox2)
        
        blueBox3.translatesAutoresizingMaskIntoConstraints = false
        blueBox3.backgroundColor = UIColor.blue
        view.addSubview(blueBox3)
        
        // blueBox2 always center of greenbox(framingView)
        let blueBox2Width = NSLayoutConstraint.init(item: blueBox2, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        blueBox2Width.isActive = true
        
        let blueBox2Height = NSLayoutConstraint.init(item: blueBox2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        blueBox2Height.isActive = true
        
        let blueBox2XConstraint = NSLayoutConstraint.init(item: blueBox2, attribute: .centerX, relatedBy: .equal, toItem: framingView, attribute: .centerX, multiplier: 1.0, constant: 0)
        blueBox2XConstraint.isActive = true
        
        let blueBox2YConstraint = NSLayoutConstraint.init(item: blueBox2, attribute: .centerY, relatedBy: .equal, toItem: framingView, attribute: .centerY, multiplier: 1.0, constant: 0)
        blueBox2YConstraint.isActive = true
        
        
        // blueBox1
        let blueBox1Width = NSLayoutConstraint.init(item: blueBox1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        blueBox1Width.isActive = true
        
        let blueBox1Height = NSLayoutConstraint.init(item: blueBox1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        blueBox1Height.isActive = true

        let blueBox1XConstraint = NSLayoutConstraint.init(item: blueBox1, attribute: .centerX, relatedBy: .equal, toItem: framingView, attribute: .centerX, multiplier: 1.0, constant: 0)
        blueBox1XConstraint.isActive = true
        
        let blueBox1BottomConstraint = NSLayoutConstraint.init(item: blueBox1, attribute: .bottom, relatedBy: .equal, toItem: blueBox2, attribute: .top, multiplier: 1.0, constant: -30) //?????
        blueBox1BottomConstraint.isActive = true
        
        // blueBox3
        let blueBox3Width = NSLayoutConstraint.init(item: blueBox3, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        blueBox3Width.isActive = true
        
        let blueBox3Height = NSLayoutConstraint.init(item: blueBox3, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        blueBox3Height.isActive = true
        
        let blueBox3XConstraint = NSLayoutConstraint.init(item: blueBox3, attribute: .centerX, relatedBy: .equal, toItem: framingView, attribute: .centerX, multiplier: 1.0, constant: 0)
        blueBox3XConstraint.isActive = true
        
        let blueBox3BottomConstraint = NSLayoutConstraint.init(item: blueBox3, attribute: .top, relatedBy: .equal, toItem: blueBox2, attribute: .bottom, multiplier: 1.0, constant: 30) //?????
        blueBox3BottomConstraint.isActive = true
        
        
// red Box
        redBox.translatesAutoresizingMaskIntoConstraints = false
        redBox.backgroundColor = UIColor.red
        view.addSubview(redBox)
        
        let redHeightConstraint = NSLayoutConstraint.init(item: redBox, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        redHeightConstraint.isActive = true
        
        let redWidthConstraint = NSLayoutConstraint.init(item: redBox, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150)
        redWidthConstraint.isActive = true
        
        let redRightConstraint = NSLayoutConstraint.init(item: redBox, attribute: .right, relatedBy: .equal, toItem: framingView, attribute: .right, multiplier: 1.0, constant: -20)
        redRightConstraint.isActive = true
        
        let redTopConstraint = NSLayoutConstraint.init(item: redBox, attribute: .top, relatedBy: .equal, toItem: framingView, attribute: .top, multiplier: 1.0, constant: 20)
        redTopConstraint.isActive = true
        
// orangeBox
        // orangeBox1
        orangeBox1.translatesAutoresizingMaskIntoConstraints = false
        orangeBox1.backgroundColor = UIColor.orange
        view.addSubview(orangeBox1)

        let orange1WidthConstraint = NSLayoutConstraint.init(item: orangeBox1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        orange1WidthConstraint.isActive = true
        
        let orange1HeightConstraint = NSLayoutConstraint.init(item: orangeBox1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
        orange1HeightConstraint.isActive = true

        let orange1YConstraint = NSLayoutConstraint.init(item: orangeBox1, attribute: .centerY, relatedBy: .equal, toItem: redBox, attribute: .centerY, multiplier: 1.0, constant: 0)
        orange1YConstraint.isActive = true
        
        let orange1Left = NSLayoutConstraint.init(item: orangeBox1, attribute: .right, relatedBy: .equal, toItem: redBox, attribute: .right, multiplier: 1.0, constant: -10)
        orange1Left.isActive = true
        
        // orangeBox2
        orangeBox2.translatesAutoresizingMaskIntoConstraints = false
        orangeBox2.backgroundColor = UIColor.orange
        view.addSubview(orangeBox2)

        let orange2WidthConstraint = NSLayoutConstraint.init(item: orangeBox2, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 70)
        orange2WidthConstraint.isActive = true

        let orange2HeightConstraint = NSLayoutConstraint.init(item: orangeBox2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
        orange2HeightConstraint.isActive = true
        
        let orange2YConstraint = NSLayoutConstraint.init(item: orangeBox2, attribute: .centerY, relatedBy: .equal, toItem: redBox, attribute: .centerY, multiplier: 1.0, constant: 0)
        orange2YConstraint.isActive = true
        
        let orange2Right = NSLayoutConstraint.init(item: orangeBox2, attribute: .right, relatedBy: .equal, toItem: orangeBox1, attribute: .left, multiplier: 1.0, constant: -10)
        orange2Right.isActive = true
        
    }

    func resizeFramingView(_ sender: UIButton) {
        var newWidth: CGFloat = 0.0
        var newHeight: CGFloat = 0.0
        if (sender == self.squareButton) {
            newWidth = 500.0
            newHeight = 500.0
        } else if (sender == self.portraitButton) {
            newWidth = 350.0
            newHeight = 550.0
        } else if (sender == self.landscapeButton) {
            newWidth = 900.0
            newHeight = 300.0
        }
        
        UIView.animate(withDuration: 2.0) {
            self.framingViewHeightConstraint.constant = newHeight
            self.framingViewWidthConstraint.constant = newWidth
            self.view.layoutIfNeeded()
        }
    }
}

