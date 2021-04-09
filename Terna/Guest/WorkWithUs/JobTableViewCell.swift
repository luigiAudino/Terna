//
//  WorkTableViewCell.swift
//  Terna
//
//  Created by Luigi Audino on 09/04/21.
//

import UIKit

class JobTableViewCell: UITableViewCell {

    @IBOutlet weak var emojiLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setStyleCell(cornerRadius: CGFloat, backgroundColor: UIColor, textColor: UIColor) {
        containerView.layer.cornerRadius = cornerRadius
        containerView.backgroundColor = backgroundColor
        titleLbl.textColor = textColor
        descriptionLbl.textColor = textColor
    }
}
