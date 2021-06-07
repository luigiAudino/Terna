//
//  CompletedStepsModalVC.swift
//  Terna
//
//  Created by Luigi Scherillo on 10/04/21.
//

import UIKit

class CompletedStepsModalVC: UIViewController {

    @IBOutlet private weak var sheetView: UIView?
    @IBOutlet private weak var thankYouButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sheetView?.layer.cornerRadius = 30
        self.thankYouButton?.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }

    @IBAction func thankyouAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
