//
//  CompletedStepsModalVC.swift
//  Terna
//
//  Created by Luigi Scherillo on 10/04/21.
//

import UIKit

class CompletedStepsModalVC: UIViewController {

    @IBOutlet private weak var sheetView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func thankyouAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
