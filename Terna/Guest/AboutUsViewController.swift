//
//  AboutUsViewController.swift
//  Terna
//
//  Created by Luigi Audino on 09/04/21.
//

import UIKit
class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = Color.firstBlue
        self.title = "Chi Siamo"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "Lato", size: 20)!]
        // Do any additional setup after loading the view.
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
