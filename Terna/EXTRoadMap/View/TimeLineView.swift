//
//  TimeLineView.swift
//  Terna
//
//  Created by Luigi Scherillo on 09/04/21.
//

import Foundation
import UIKit

protocol TimeLineDelegate: UITableViewDelegate {
    func listOfSteps() -> [TimeLineStep]
}


class TimeLineView: UIView
{
    
    @IBOutlet private var tableView: UITableView?
    private var cellToLoad = 0
    private var models: [TimeLineCellModel] = []
    private var steps: [TimeLineStep] = []
    public weak var delegate: TimeLineDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if(self.tableView == nil) {
            self.tableView = UITableView(frame: self.frame, style: .grouped)
        }
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        //MOCK DA ELIMINARE
        tableView?.separatorColor = UIColor.clear

        
        self.steps = self.delegate?.listOfSteps() ?? []
        
        for _ in 1...self.steps.count {
            if models.count == 0 {
                let model = TimeLineCellModel(shouldLoad: true)
                self.models.append(model)
            }
            let model = TimeLineCellModel(shouldLoad: false)
            self.models.append(model)
            
        }
    }
}

extension TimeLineView: UITableViewDelegate, UITableViewDataSource, TimeLineCellDelegate {
    func animationDidFinish() {
        models[cellToLoad].shouldLoad = false
        
        if(cellToLoad + 1 < models.count ) {
            self.cellToLoad += 1
            models[cellToLoad].shouldLoad = true
            
            let indexPath = IndexPath(row: cellToLoad, section: 0)
            
            tableView?.beginUpdates()
            tableView?.reloadRows(at: [indexPath], with: .none)
            tableView?.endUpdates()
            
        }
        if models[cellToLoad].shouldLoad == true && steps[cellToLoad].isStepActive == true || steps[cellToLoad].completed == true {
            let indexPath = IndexPath(row: cellToLoad, section: 0)
            tableView?.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.middle, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "timeLineCell") as? TimeLineTableViewCell else {
            return UITableViewCell()
        }
        
        if(indexPath.row % 2 == 0){
            models[indexPath.row].textPosition = .right
        }else{
            models[indexPath.row].textPosition = .left
        }
        
        cell.setup(delegate: self, model: models[indexPath.row], step: steps[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    private func mockSteps() {
        
        let stepsArrayDic: [Dictionary<String, Any>] = [["completed":true, "completedPercentage":100.0, "stepTitle":"Titolo Uno", "stepDescription":"Descrizione bella uno", "color":UIColor.green, "isStepActive": false],["completed":true, "completedPercentage":100.0, "stepTitle":"Titolo Due", "stepDescription":"Descrizione bella due", "color":UIColor.yellow, "isStepActive": false],["completed":false, "completedPercentage":20.0, "stepTitle":"Titolo Tre", "stepDescription":"Descrizione bella tre", "color":UIColor.purple, "isStepActive": true],["completed":false, "completedPercentage":0.0, "stepTitle":"Titolo Quattro", "stepDescription":"Descrizione bella quattro", "color":UIColor.blue,"isStepActive": false],["completed":false, "completedPercentage":0.0, "stepTitle":"Titolo Cinque", "stepDescription":"Descrizione bella cinque", "color":UIColor.red,"isStepActive": false]]
        
        stepsArrayDic.forEach { (stepDic) in
            
            if let completed = stepDic["completed"] as? Bool,
               let completedPercentage = stepDic["completedPercentage"] as? Double,
               let stepTitle = stepDic["stepTitle"] as? String,
               let stepDescription = stepDic["stepDescription"] as? String,
               let isStepActive = stepDic["isStepActive"] as? Bool,
               let color = stepDic["color"] as? UIColor {
                let step = TimeLineStep(completed: completed, completedPercentage: completedPercentage, stepTitle: stepTitle, stepDescription: stepDescription, color: color, isStepActive: isStepActive)
                self.steps.append(step)
            }
        }
    }
}
