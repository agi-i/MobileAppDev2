import UIKit
class AnnouncementsViewController: UITableViewController {
    private var context: NSManagedObjectContext {
    (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    override func viewDidLoad() {
    super.viewDidLoad()
    title = "Campus Announcements"
    seedInitialAnnouncementsIfNeeded()
    loadAnnouncements()
    }
    private func seedInitialAnnouncementsIfNeeded() {
    let request: NSFetchRequest<CampusAnnouncement> = CampusAnnouncement.fetchRequest()
    let existingCount = (try? context.count(for: request)) ?? 0
    guard existingCount == 0 else { return }
    // insert the seed announcements, then:
    try? context.save()
    }
    private func loadAnnouncements() {
    let request: NSFetchRequest<CampusAnnouncement> = CampusAnnouncement.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
    announcements = (try? context.fetch(request)) ?? []
    tableView.reloadData()
    }
    private var announcements: [CampusAnnouncement] = []
    private var selectedAnnouncement: CampusAnnouncement?
    
    @IBAction func addAnnouncementTapped(_ sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "New Announcement",
    message: "Enter a title and category.",
    preferredStyle: .alert)
    alert.addTextField { textField in textField.placeholder = "Title" }
    alert.addTextField { textField in textField.placeholder = "Category" }
    let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self, weak alert] _ in
    guard let self = self,
    let titleText = alert?.textFields?[0].text, !titleText.isEmpty,
    let categoryText = alert?.textFields?[1].text, !categoryText.isEmpty else { return }
    let newAnnouncement = CampusAnnouncement(context: self.context)
    newAnnouncement.title = titleText
    newAnnouncement.date = DateFormatter.localizedString(from: Date(),
    dateStyle: .long, timeStyle: .none)
    newAnnouncement.category = categoryText
    try? self.context.save()
    self.loadAnnouncements()
    }
    alert.addAction(saveAction)
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return announcements.count
    }
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "AnnouncementCell", for: indexPath)
                as? AnnouncementCell else {
            return UITableViewCell()
        }
        func tableView(_ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedAnnouncement = announcements[indexPath.row]
        performSegue(withIdentifier: "ShowAnnouncementDetailSegue", sender: self)
        }
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowAnnouncementDetailSegue",
        let destination = segue.destination as? DetailViewController,
        let announcement = selectedAnnouncement else { return }
        destination.announcement = announcement
        }
        cell.configure(with: announcements[indexPath.row])
        return cell
    }
}
