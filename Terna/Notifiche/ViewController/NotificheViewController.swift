//
//  NotificheViewController.swift
//  Terna
//
//  Created by Luigi Scherillo on 10/04/21.
//

import Foundation
import UIKit



class NotificheViewController: UIViewController
{
    @IBOutlet private weak var tableView: UITableView?
    private var listOfNotifications: [Notification] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = Color.firstBlue
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font : UIFont(name: "Lato-Bold", size: 20)!]
        self.title = "Notifiche"
        BusinessManager.readNotificheMock { (notifications) in
            self.listOfNotifications = notifications
            self.tableView?.reloadData()
        }
    }
}

extension NotificheViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfNotifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell") as? NotificationViewCell else {
            return UITableViewCell()
        }
        cell.setup(notification: listOfNotifications[indexPath.row])
        return cell
    }
    
}
