//
//  WorkViewController.swift
//  Terna
//
//  Created by Luigi Audino on 09/04/21.
//

import UIKit

class JobViewController: UIViewController, UISearchControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    private var identifier = "JobTableViewId"
    private var jobs = [Job]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        
        initSearch()
        
        readJobMock()
    }
    
    private func readJobMock() {
        if let path = Bundle.main.path(forResource: "job", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                if let jobList = JobResult.decode(data: data)?.jobs {
                    jobs = jobList
                }
                
            } catch let e {
                print(e)
            }
        }
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "JobTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
    }
    
    private func initSearch() {
        let search = UISearchController(searchResultsController: nil)
        search.delegate = self
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        super.navigationItem.searchController = search
    }
    
}

extension JobViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! JobTableViewCell
        cell.titleLbl.text = jobs[indexPath.row].title
        cell.descriptionLbl.text = jobs[indexPath.row].description
        cell.emojiLbl.text = jobs[indexPath.row].emoji
        cell.setStyleCell(cornerRadius: 5, backgroundColor: Color.firstBlue, textColor: .white)
        return cell
    }
}

extension JobViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
}
