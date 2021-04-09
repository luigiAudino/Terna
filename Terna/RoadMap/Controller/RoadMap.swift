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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImage(named: "Logo_Terna_clear")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        self.navigationController?.navigationBar.barTintColor = Color.firstBlue

        self.stepsView?.delegate = self
        self.stepsView?.loadSteps()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func mockSteps() -> [TimeLineStep] {
        
        var stepsArray: [TimeLineStep] = []
        
        let stepsArrayDic: [Dictionary<String, Any>] = [["completed":true, "completedPercentage":100.0, "stepTitle":"Titolo Uno", "stepDescription":"Descrizione bella uno", "color":UIColor(hexString: "FFAA2A", alpha: 1.0), "isStepActive": false],["completed":true, "completedPercentage":100.0, "stepTitle":"Titolo Due", "stepDescription":"Descrizione bella due", "color":UIColor(hexString: "FF7556", alpha: 1.0), "isStepActive": false],["completed":false, "completedPercentage":20.0, "stepTitle":"Titolo Tre", "stepDescription":"Descrizione bella tre", "color":UIColor(hexString: "C77878", alpha: 1.0), "isStepActive": true],["completed":false, "completedPercentage":0.0, "stepTitle":"Titolo Quattro", "stepDescription":"Descrizione bella quattro", "color":UIColor(hexString: "00A8DE", alpha: 1.0),"isStepActive": false],["completed":false, "completedPercentage":0.0, "stepTitle":"Titolo Cinque", "stepDescription":"Descrizione bella cinque", "color":UIColor(hexString: "00AFBB", alpha: 1.0),"isStepActive": false]]
        
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
    func listOfSteps() -> [TimeLineStep] {
        return self.mockSteps()
    }
    
    
}
