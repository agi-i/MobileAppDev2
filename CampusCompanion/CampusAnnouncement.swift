
import Foundation
    struct CampusAnnouncement {
        let title: String
        let date: String
        let category: String
}
    extension CampusAnnouncement {
        static let sampleAnnouncements: [CampusAnnouncement] = [
            CampusAnnouncement(title: "Enrollment Period Extended",
                               date: "August 3, 2026", category: "Registrar"),
// ... at least 5 more sample records
]
}
