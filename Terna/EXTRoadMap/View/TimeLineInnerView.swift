//
//  TimeLineInnerView.swift
//  Terna
//
//  Created by Luigi Scherillo on 09/04/21.
//

import Foundation
import UIKit
class TimeLineInnerView: UIView
{
    private var colouredView: UIView?
    private var stepPercetage: Double?
    private var didAnimate = false

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 20
        
    }
    
    func setup(color: UIColor, percentage: Double) {
        self.backgroundColor = UIColor.white
        self.layer.borderWidth = 5
        self.layer.borderColor = color.cgColor
        self.colouredView = UIView(frame: CGRect(x: 0 , y: 0, width: self.frame.width, height: 0))
        self.stepPercetage = percentage
        self.colouredView?.backgroundColor = color
        self.addSubview(colouredView!)
        self.bringSubviewToFront(colouredView!)
        layoutIfNeeded()
    }
    
    func reset() {
        self.colouredView?.backgroundColor = .clear
        self.colouredView?.frame.size.height = 0
    }
    
    func animate() {
        self.colouredView?.layoutIfNeeded()
        self.layoutIfNeeded()
        UIView.animate(withDuration: 1, delay: 0.5) {
            guard let percentage = self.stepPercetage else { return }
            self.colouredView?.frame.size.height = CGFloat(percentage) / 100 * self.frame.size.height
            self.colouredView?.layoutIfNeeded()
            self.layoutIfNeeded()
        }
    }
}
