//
//  RoadMap.swift
//  Terna
//
//  Created by Luigi Scherillo on 09/04/21.
//

import Foundation
import UIKit

class RoadMap: UIViewController
{
    
    @IBOutlet private weak var stepsView: TimeLineView?
    @IBOutlet weak var storiesContainerView: UIView!
    @IBOutlet weak var leftStoryAnimatedView: UIView!
    @IBOutlet weak var rightStoryAnimatedView: UIView!
    @IBOutlet weak var rightStoryAnimatedViewWidth: NSLayoutConstraint!
    @IBOutlet weak var leftStoryAnimatedViewWidth: NSLayoutConstraint!
    private var progressViewOne: UIView?
    private var progressViewTwo: UIView?
    private var didShowSuccessTutorial = false
    private var stepArray: [Step] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImage(named: "Logo_Terna_clear")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        self.navigationController?.navigationBar.barTintColor = Color.firstBlue
        BusinessManager.readStepMock { (steps) in
            self.stepArray = steps
        }
//        self.addProgressViewOnBottomStories()
        self.addStories()
        self.stepsView?.delegate = self
        self.stepsView?.loadSteps()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rightStoryAnimatedViewWidth.constant = self.view.frame.size.width / 2
        self.leftStoryAnimatedViewWidth.constant = self.view.frame.size.width / 2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.animateBottomStories()
    }
    
    private func addStories() {
        let storiesViewsController = StoriesViewController()
        self.storiesContainerView.addSubview(storiesViewsController.view)
        self.addChild(storiesViewsController)
        storiesViewsController.didMove(toParent: self)
        storiesViewsController.view.frame = CGRect(x:0, y: 0, width: storiesContainerView.frame.width, height: storiesContainerView.frame.height - 10)
        BusinessManager.readStoryMock { (stories) in
            storiesViewsController.loadWithStories(stories: stories)
        }
    }
    
    
    private func animateBottomStories() {
        UIView.animate(withDuration: 1.5) {
            self.progressViewOne?.frame.size.width = self.leftStoryAnimatedView.frame.size.width
            self.progressViewTwo?.frame.size.width = 0
        }
    }
    
    private func addProgressViewOnBottomStories() {

        self.progressViewOne = UIView(frame: self.leftStoryAnimatedView.frame)
        self.progressViewOne?.frame.size.width = 0
        self.progressViewOne?.backgroundColor = Color.firstBlue
        self.progressViewTwo = UIView(frame: self.rightStoryAnimatedView.frame)
        self.progressViewTwo?.backgroundColor = .white
        
        self.leftStoryAnimatedView.addSubview(progressViewOne!)
        self.rightStoryAnimatedView.addSubview(progressViewTwo!)
    }

}

extension RoadMap: TimeLineDelegate {
    func presentCompletedScreen() {
        var count = 0
        self.stepArray.forEach { (step) in
            if step.completed == true {
                count += 1
            }
        }
        
        if( count == stepArray.count && self.didShowSuccessTutorial == false && self.isViewLoaded && (self.view.window != nil)) {
            let completedVC = CompletedStepsModalVC(nibName: "CompletedStepsModalVC", bundle: nil)
            completedVC.modalPresentationStyle = .overFullScreen
            self.present(completedVC, animated: true, completion: nil)
            self.didShowSuccessTutorial = true
        }

    }
    
    func listOfSteps() -> [Step] {
        return self.stepArray
        
    }
    
    
}
