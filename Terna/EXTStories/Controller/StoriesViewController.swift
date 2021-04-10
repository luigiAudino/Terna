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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetails" {
//             let destination = segue.destination as! StoryDetailViewController
//             let indexPath = tableView.indexPathForSelectedRow!
//             destination.rideIndex = indexPath.row
//         }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let userStoryboard = UIStoryboard(name: "UserStoryboard", bundle: nil)
        let destination = userStoryboard.instantiateViewController(withIdentifier: "StoryDetailViewController") as! StoryDetailViewController
        destination.index = indexPath.row
        destination.modalPresentationStyle = .fullScreen
        self.present(destination, animated: true, completion: nil)
    }
}
