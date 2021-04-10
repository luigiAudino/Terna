//
//  StoryDetailViewController.swift
//  Terna
//
//  Created by Luigi Audino on 09/04/21.
//

import UIKit

class StoryDetailViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var index: Int?
    var stories = [Story]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let indexPath = IndexPath(item: index ?? 0, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
    }
    
    private func initCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "StoryDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoryDetailCell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        self.collectionView.collectionViewLayout = layout
        self.collectionView.isPagingEnabled = false
        
        BusinessManager.readStoryMock {
            (storiesMock) in
            self.stories = storiesMock
            self.collectionView.reloadData()
            let indexPath = IndexPath(item: index ?? 0, section: 0)
            self.collectionView?.isPagingEnabled = false
            self.collectionView.scrollToItem(at: indexPath, at: .right,animated: false)
            
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { timer in
                self.collectionView?.isPagingEnabled = true
            }
            
        }
    }
}

extension StoryDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryDetailCell", for: indexPath) as! StoryDetailCollectionViewCell
        let story = stories[indexPath.row]
        cell.delegate = self
        cell.lbl.text = story.description
        cell.containerView.backgroundColor = .green
        
        cell.pippo = index == indexPath.row
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
}

extension StoryDetailViewController: StoryDetailProtocol {
    func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
