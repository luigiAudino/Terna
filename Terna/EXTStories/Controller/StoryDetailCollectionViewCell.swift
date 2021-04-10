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
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
            if let next = self.nextIndex {
                print("Sono nel completition")
                self.delegate?.storyCompleted(index: next)
            }
        }
        
//        UIView.animate(withDuration: 3, delay: 5) {
//            print("Ciao")
//        } completion: { _ in
//            if let next = self.nextIndex {
//                print("Sono nel completition")
//                self.delegate?.storyCompleted(index: next)
//            }
//        }
    }
}
