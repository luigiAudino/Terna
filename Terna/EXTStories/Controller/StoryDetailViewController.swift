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
        story.shouldLoad = index == indexPath.row
        cell.setup(delegate: self, story: story, nextIndex: indexPath.row)
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let guide = view.safeAreaLayoutGuide
        let height = guide.layoutFrame.size.height
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
}

extension StoryDetailViewController: StoryDetailProtocol {
    func storyCompleted(index: Int) {
        let indexPath = IndexPath(row: index + 1, section: 0)
        let indexPathNext = IndexPath(row: index + 1, section: 0)
        
        if(index < stories.count - 1) {
            stories[index + 1].shouldLoad = true
            self.index?+=1
            collectionView.reloadItems(at: [indexPath, indexPathNext])
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: indexPath, at: .right,animated: false)
            
            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { timer in
                self.collectionView?.isPagingEnabled = true
            }
        }
        else {
            closeAction()
        }
        
    }
    
    func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
