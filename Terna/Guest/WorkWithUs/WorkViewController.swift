//
//  WorkViewController.swift
//  Terna
//
//  Created by Luigi Audino on 05/04/21.
//

import UIKit

class WorkViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var identifier = "WorkTableViewId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "WorkTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
    }
    
}

extension WorkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! WorkTableViewCell
        return cell
    }
    
    
}
