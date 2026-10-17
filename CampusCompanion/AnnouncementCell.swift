//
//  AnnouncementCell.swift
//  CampusCompanion
//
//  Created by SHAYNE AGATHA JOVENIR on 10/24/26.
//

import UIKit
    class AnnouncementCell: UITableViewCell {
        @IBOutlet weak var categoryIconImageView: UIImageView!
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var dateLabel: UILabel!
        
func configure(with announcement: CampusAnnouncement) {
titleLabel.text = announcement.title
dateLabel.text = "\(announcement.category) • \(announcement.date)"
categoryIconImageView.image = UIImage(systemName: "megaphone.fill")
}
}
