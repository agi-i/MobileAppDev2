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
        
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Campus Events"
            let notificationStatus = notificationsEnabled ? "on" : "off"
           messageLabel.text = "Hello, \(studentName)! (\(selectedRole)) Notifications: \(notificationStatus)."
}
}
