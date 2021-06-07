//
//  AnimatedRoundedView.swift
//  Terna
//
//  Created by Luigi Scherillo on 10/04/21.
//

import Foundation
import UIKit

class AnimatedRoundedView: UIView {
    
    public func addCircularAnimation() {
        self.layoutSubviews()
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x:self.frame.midX + 8, y:self.frame.midY + 8), radius: 40, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi - CGFloat.pi/2, clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor(hexString: "#2D5FB8").cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = CAShapeLayerLineCap.round

        self.layer.addSublayer(shapeLayer)

        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = Double(1.5)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        shapeLayer.add(basicAnimation, forKey: "basicAnim")
    }
    
}
