//
//  DetailViewController.swift
//  CampusCompanion
//
//  Created by SHAYNE AGATHA JOVENIR on 9/26/26.
//

import UIKit
class DetailViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    var studentName: String = ""
    var notificationsEnabled: Bool = false
    var selectedRole: String = ""
    
    var announcement: CampusAnnouncement?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let announcement = announcement {
            title = announcement.category
            messageLabel.text = "\(announcement.title)\n\(announcement.date)"
        } else {
            title = "Campus Events"
            let notificationStatus = notificationsEnabled ? "on" : "off"
            messageLabel.text = "Welcome, \(studentName)! (\(selectedRole)) Notifications: \(notificationStatus)."
            
        }
    }
}
