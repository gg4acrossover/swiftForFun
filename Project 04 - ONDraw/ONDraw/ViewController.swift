//
//  ViewController.swift
//  ONDraw
//
//  Created by viethq on 6/19/17.
//  Copyright © 2017 viethq. All rights reserved.
//

import UIKit

private let w : CGFloat = 100.0
private let h : CGFloat = 100.0

class ViewController: UIViewController {

    let shapeLayer = CAShapeLayer()
    let container : UIView = {
        let v = UIView(frame: CGRect(x: 0.0, y: 0.0, width: w, height: h))
        v.layer.cornerRadius = w*0.5
        v.backgroundColor = UIColor.gray
        v.center = CGPoint(x: UIScreen.main.bounds.width*0.5, y: UIScreen.main.bounds.height*0.5)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        let bezierPath = UIBezierPath()
        let arcCenter = CGPoint(x: w*0.5, y: h*0.5)
        bezierPath.addArc(withCenter: arcCenter,
                          radius: w*0.5,
                          startAngle: 0.0,
                          endAngle: CGFloat(2*Double.pi),
                          clockwise: true)
        
        shapeLayer.path = bezierPath.cgPath
        
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 4.0
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.frame = bezierPath.cgPath.boundingBox
        
        container.layer.addSublayer(shapeLayer)
        self.view.addSubview(container)
        
        self.playAnim()
    }
    
    func playAnim() {
        // anim 1
        let firstStroke = CABasicAnimation(keyPath: "strokeEnd")
        
        firstStroke.fromValue = 0.0
        firstStroke.byValue = 0.5
        firstStroke.duration = 1.0
        
        // anim 2
        let secondStroke = CABasicAnimation(keyPath: "strokeEnd")
        
        secondStroke.fromValue = 0.5
        secondStroke.toValue = 0.0
        secondStroke.duration = 1.0
        secondStroke.beginTime = 1.0
        
        // anim 3
        let rotateAnim = CAKeyframeAnimation(keyPath: "transform.rotation")
        rotateAnim.values = [0.0, 2*Double.pi]
        rotateAnim.duration = 2.0
        rotateAnim.isAdditive = true
        
        // play all animations with CAAnimationGroup
        let group = CAAnimationGroup()
        group.animations = [firstStroke, secondStroke, rotateAnim]
        group.isRemovedOnCompletion = false
        group.fillMode = kCAFillModeForwards
        group.duration = 2.0
        group.repeatCount = Float.infinity // repeat forever
        
        shapeLayer.add(group, forKey: "circle")
    }
}
