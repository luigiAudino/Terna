//
//  VideoCell.swift
//  BeginnerTableView
//
//  BeginnerTableView
//
//  Created by Piero Junior Gaetani on 10/04/21.
//
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var chatImageView: UIImageView!
  
    @IBOutlet weak var chatTitleLabel: UILabel!
    @IBOutlet weak var ultimoMessaggioLabel: UILabel!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    func setChat(chat: Chat , chatAnimation: Bool) {
        chatImageView.image = chat.image
        
        chatImageView.layer.borderWidth = 2.0
        chatImageView.layer.masksToBounds = false
        chatImageView.layer.borderColor = UIColor.black.cgColor
        chatImageView.layer.cornerRadius = 37
        chatImageView.clipsToBounds = true
        
        chatTitleLabel.text = chat.title
        ultimoMessaggioLabel.text = chat.ultimoMessaggioLabel
        dataLabel.text = chat.dataLabel
     
    
        if (chatAnimation) {
            chatImageView.addCircularAnimation()
            chatImageView.layer.borderWidth = 0
        }
       
    }
    
    
    
   
    
}

extension UIImageView{
    
    public func addCircularAnimation() {
        self.layoutSubviews()
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x:self.frame.midX - 8, y:self.frame.midY - 4), radius: 36, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi - CGFloat.pi/2, clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 5
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
