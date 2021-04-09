//
//  StoriesCollectionViewCell.swift
//  Terna
//
//  Created by Luigi Scherillo on 09/04/21.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView?
    @IBOutlet weak var CircleImage: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView?.clipsToBounds = true
        self.imageView?.layer.masksToBounds = false
        self.CircleImage.clipsToBounds = true
        self.CircleImage.layer.masksToBounds = false
    }
    
    override func layoutSubviews() {
        self.imageView?.layer.cornerRadius = self.imageView!.layer.frame.size.width / 2
        self.imageView?.layer.borderColor = UIColor.white.cgColor
        
        self.CircleImage.layer.cornerRadius = 30
        self.CircleImage.layer.borderWidth = 2
        super.layoutSubviews()

    }
    
    
    
    public func setup(story: Story) {
        self.imageView?.image = UIImage(named:story.image)
        self.imageView?.backgroundColor =  UIColor(hexString: story.colorHex, alpha: 1.0)
    }
}
