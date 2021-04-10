//
//  TimeLineLastCell.swift
//  Terna
//
//  Created by Luigi Scherillo on 10/04/21.
//

import Foundation
import UIKit

class TimeLineLastCell: UITableViewCell
{
    
    public func setup(model: TimeLineCellModel) {
        if(model.shouldLoad) {
            self.animateConverView()
        }
    }

    
    private func animateConverView() {

    }
}
