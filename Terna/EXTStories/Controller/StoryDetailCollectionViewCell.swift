//
//  StoryDetailCollectionViewCell.swift
//  Terna
//
//  Created by Luigi Audino on 09/04/21.
//

import UIKit

protocol StoryDetailProtocol {
    func closeAction()
}

class StoryDetailCollectionViewCell: UICollectionViewCell {
    var delegate: StoryDetailProtocol?
    var pippo: Bool?
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var closeBtn: UIButton!
    
    @IBAction func closeBtnPress(_ sender: Any) {
        delegate?.closeAction()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
