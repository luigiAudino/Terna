//
//  NotificationViewCell.swift
//  Terna
//
//  Created by Luigi Scherillo on 10/04/21.
//

import Foundation
import UIKit

class NotificationViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var descriptionLabel: UILabel?
    
    public func setup(notification: Notification){
        self.titleLabel?.text = notification.title
        self.descriptionLabel?.text = notification.description
    }
    
}
