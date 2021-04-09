//
//  StoriesCollectionViewCell.swift
//  Terna
//
//  Created by Luigi Scherillo on 09/04/21.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView?.layer.cornerRadius = self.imageView?.layer.frame.size.width ?? 40 / 2
    }
    
    public func setup(story: Story) {
        self.imageView?.image = UIImage(named:story.image)
        self.imageView?.backgroundColor =  UIColor(hexString: story.colorHex, alpha: 1.0)
    }
}
