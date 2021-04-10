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
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImage(named: "Logo_Terna_clear")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        self.navigationController?.navigationBar.barTintColor = Color.firstBlue
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
    
    private func mockSteps() -> [TimeLineStep] {
        
        var stepsArray: [TimeLineStep] = []
        
        let stepsArrayDic: [Dictionary<String, Any>] = [["completed":true, "completedPercentage":100.0, "stepTitle":"Consegna kit", "stepDescription":"La consegna del kit aziendale è il primo passaggio fondamentale per cominciare a lavorare.", "color":UIColor(hexString: "FFAA2A", alpha: 1.0), "isStepActive": false],["completed":true, "completedPercentage":100.0, "stepTitle":"Corsi di sicurezzza", "stepDescription":"La salute prima di tutto. Completa tutti i corsi di sicurezza sul lavoro", "color":UIColor(hexString: "FF7556", alpha: 1.0), "isStepActive": false],["completed":true, "completedPercentage":100.0, "stepTitle":"Conoscenze", "stepDescription":"Il rapporto con i colleghi è fondamnetale per godere della vita aziendale", "color":UIColor(hexString: "C77878", alpha: 1.0), "isStepActive": false],["completed":true, "completedPercentage":100.0, "stepTitle":"Competeze ", "stepDescription":"Approfondisci delle competenze già acquisite. Discutine con il tuo responsabile.", "color":UIColor(hexString: "00A8DE", alpha: 1.0),"isStepActive": false]]
        
        stepsArrayDic.forEach { (stepDic) in
            
            if let completed = stepDic["completed"] as? Bool,
               let completedPercentage = stepDic["completedPercentage"] as? Double,
               let stepTitle = stepDic["stepTitle"] as? String,
               let stepDescription = stepDic["stepDescription"] as? String,
               let isStepActive = stepDic["isStepActive"] as? Bool,
               let color = stepDic["color"] as? UIColor {
                let step = TimeLineStep(completed: completed, completedPercentage: completedPercentage, stepTitle: stepTitle, stepDescription: stepDescription, color: color, isStepActive: isStepActive)
                stepsArray.append(step)
            }
        }
        return stepsArray
    }
}

extension RoadMap: TimeLineDelegate {
    func presentCompletedScreen() {
        if(self.didShowSuccessTutorial == false && self.isViewLoaded && (self.view.window != nil)) {
            let completedVC = CompletedStepsModalVC(nibName: "CompletedStepsModalVC", bundle: nil)
            completedVC.modalPresentationStyle = .overFullScreen
            self.present(completedVC, animated: true, completion: nil)
            self.didShowSuccessTutorial = true
        }

    }
    
    func listOfSteps() -> [TimeLineStep] {
        return self.mockSteps()
    }
    
    
}
