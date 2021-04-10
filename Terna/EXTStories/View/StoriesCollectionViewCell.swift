//
//  StoriesCollectionViewCell.swift
//  Terna
//
//  Created by Luigi Scherillo on 09/04/21.
//

import UIKit




class StoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView?
    @IBOutlet weak var CircleImage: AnimatedRoundedView!
    private var didLoadCircule: Bool = false
    private var startAngle = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView?.clipsToBounds = true
        self.imageView?.layer.masksToBounds = false

    }
    
    override func layoutSubviews() {
        self.imageView?.layer.cornerRadius = 33

        if(!self.didLoadCircule)
        {
            self.animateBorder()
            self.CircleImage.addCircularAnimation()

            self.didLoadCircule = true
        }
        super.layoutSubviews()


    }
    
    private func animateBorder() {
//        Timer.scheduledTimer(withTimeInterval: 0.0002, repeats: true) { [weak self] timer in
////            if(self?.startAngle ?? 0 <= -270) {
////                self?.startAngle = 90
////            }
//
//            self?.startAngle -= 1
//            self?.CircleImage?.startAngle = CGFloat(self?.startAngle ?? 0)
//            self?.CircleImage?.setNeedsDisplay()
//
//        }
    }
    
    
    
    public func setup(story: Story) {
        self.imageView?.image = UIImage(named:story.icon)
        self.imageView?.backgroundColor =  UIColor(hexString: story.colorHex, alpha: 1.0)
    }
}
