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
