//
//  TimeLineLastCell.swift
//  Terna
//
//  Created by Luigi Scherillo on 10/04/21.
//

import Foundation
import UIKit

protocol TimeLineLastCellDelegate {
    func lastCellAnimationDidFinish()
}

class TimeLineLastCell: UITableViewCell
{
    
    private var delegate: TimeLineLastCellDelegate?
    
    public func setup(model: TimeLineCellModel, delegate: TimeLineLastCellDelegate) {
        self.delegate = delegate
        if(model.shouldLoad) {
            self.animateConverView()
        }
    }

    
    private func animateConverView() {
        delegate?.lastCellAnimationDidFinish()
    }
}
