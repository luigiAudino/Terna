//
//  StoriesViewController.swift
//  Terna
//
//  Created by Luigi Scherillo on 09/04/21.
//

import UIKit

class StoriesViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView?
    private var stories :[Story]?
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "StoriesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(UINib(nibName: "StoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")

    }
    
    public func loadWithStories(stories: [Story]) {
        self.stories = stories
        self.collectionView?.reloadData()
    }
    
}

extension StoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? StoriesCollectionViewCell, let story = self.stories?[indexPath.row]{
            cell.setup(story: story)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
