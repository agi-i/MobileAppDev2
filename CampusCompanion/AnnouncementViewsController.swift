import UIKit
    class AnnouncementsViewController: UITableViewController {
        private let announcements = CampusAnnouncement.sampleAnnouncements
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Campus Announcements"
}
        override func tableView(_ tableView: UITableView,
                        numberOfRowsInSection section: Int) -> Int {
return announcements.count
}
        override func tableView(_ tableView: UITableView,
                        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "AnnouncementCell", for: indexPath)
            let announcement = announcements[indexPath.row]
            cell.textLabel?.text = announcement.title
            cell.detailTextLabel?.text = announcement.date
return cell
}
}
