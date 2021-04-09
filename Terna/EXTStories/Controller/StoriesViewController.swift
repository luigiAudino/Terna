//
//  StoriesViewController.swift
//  Terna
//
//  Created by Luigi Scherillo on 09/04/21.
//

import UIKit

class StoriesViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView?
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
    
}

extension StoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        cell.backgroundColor = .yellow
        
        return cell
    }
    
    
}
