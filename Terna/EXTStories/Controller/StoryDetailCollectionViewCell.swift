//
//  StoryDetailCollectionViewCell.swift
//  Terna
//
//  Created by Luigi Audino on 09/04/21.
//

import UIKit

protocol StoryDetailProtocol {
    func closeAction()
    func storyCompleted(index: Int)
}

class StoryDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var progressBarWidth: NSLayoutConstraint!
    
    
    private var delegate: StoryDetailProtocol?
    private var nextIndex: Int?
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var closeBtn: UIButton!
    
    @IBAction func closeBtnPress(_ sender: Any) {
        delegate?.closeAction()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(delegate: StoryDetailProtocol, story: Story, nextIndex: Int) {
        self.nextIndex = nextIndex
        self.delegate = delegate
        self.lbl.text = story.description
        if(story.shouldLoad) {
            startProgressStory()
        }
    }

    private func startProgressStory() {
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
//            if let next = self.nextIndex {
//                self.delegate?.storyCompleted(index: next)
//            }
//        }
        self.layoutIfNeeded()

        UIView.animate(withDuration: 3) {
            self.layoutSubviews()
            self.layoutIfNeeded()
            self.progressView.layoutIfNeeded()
            self.progressBarWidth.constant = self.frame.size.width

//            self.progressView.frame.size.width = self.frame.size.width
            self.layoutIfNeeded()
//            self.progressBarWidth.constant = self.frame.size.width
        } completion: { _ in
            if let next = self.nextIndex {
                self.delegate?.storyCompleted(index: next)
            }
        }
    }
}
