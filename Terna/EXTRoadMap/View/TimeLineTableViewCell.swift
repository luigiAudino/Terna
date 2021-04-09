//
//  TimeLineTableViewCell.swift
//  Terna
//
//  Created by Luigi Scherillo on 09/04/21.
//

import Foundation
import UIKit
protocol TimeLineCellDelegate {
    func animationDidFinish()
}

class TimeLineTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var stepView: TimeLineInnerView?
    private var delegate: TimeLineCellDelegate?
    @IBOutlet weak var rightStackView: UIStackView!
    @IBOutlet weak var leftStackView: UIStackView!
    @IBOutlet weak var rightTitleLabel: UILabel!
    @IBOutlet weak var rightDescriptionLabel: UILabel!
    @IBOutlet weak var leftTitleLabel: UILabel!
    @IBOutlet weak var leftDescriptionLabel: UILabel!
    @IBOutlet weak var dotWidth: NSLayoutConstraint!
    @IBOutlet weak var dotHeight: NSLayoutConstraint!
    @IBOutlet weak var dotTopSpace: NSLayoutConstraint!
    @IBOutlet weak var dotWidthSpace: NSLayoutConstraint!
    
    public func setup(delegate: TimeLineCellDelegate, model: TimeLineCellModel, step: TimeLineStep) {
        self.setupTextForPosition(model: model, step: step)

        self.stepView?.setup(color: step.color, percentage: step.completedPercentage)
        if(model.shouldLoad) {
            self.animate(step: step)
            
            self.delegate = delegate
        }
    }

    
    private func setupTextForPosition(model: TimeLineCellModel, step: TimeLineStep)
    {
        if model.textPosition == .right {
            self.rightStackView.isHidden = false
            self.leftStackView.isHidden = true
            self.rightTitleLabel.text = step.stepTitle
            self.rightDescriptionLabel.text = step.stepDescription
            self.rightTitleLabel.textColor = step.color
        } else {
            self.leftStackView.isHidden = false
            self.rightStackView.isHidden = true
            self.leftTitleLabel.text = step.stepTitle
            self.leftDescriptionLabel.text = step.stepDescription
            self.leftTitleLabel.textColor = step.color
        }
        self.stepView?.layer.cornerRadius = 20


    }
    
    func animate(step: TimeLineStep) {
        self.layoutIfNeeded()
        let _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
            if step.isStepActive {
                self.layoutIfNeeded()
                self.stepView?.layoutIfNeeded()
                UIView.animate(withDuration: 1.0, delay: 0.0) {

                    self.dotWidth.constant += 20
                    self.dotHeight.constant += 20

                    self.dotTopSpace.constant -= 20
                    self.dotWidthSpace.constant -= 20
                    self.stepView?.layer.cornerRadius = self.dotWidth.constant / 2

                    self.stepView?.layoutIfNeeded()
                    self.layoutIfNeeded()
                }
                
            }
            self.stepView?.animate()
            let cview = UIView(frame: CGRect(x: self.frame.size.width / 2 - 2 , y: 0, width: 4, height: 0))
            var color = UIColor(hexString: "#2D5FB8")
            
            if !step.isStepActive && !step.completed {
                color = UIColor(hexString: "#B9B9B9")
            }
            
            cview.backgroundColor = color
            self.insertSubview(cview, at: 1)
            cview.layoutIfNeeded()
            self.layoutIfNeeded()
            

            
            UIView.animate(withDuration: 1, delay: 0.5) {
                cview.frame.size.height = self.frame.height
                cview.layoutIfNeeded()
                self.layoutIfNeeded()
            }
            

            
            let _ = Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { timer in
                self.delegate?.animationDidFinish()
            }
        }
    }
}
