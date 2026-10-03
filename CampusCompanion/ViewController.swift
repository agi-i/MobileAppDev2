//
//  ViewController.swift
//  CampusCompanion
//
//  Created by SHAYNE AGATHA JOVENIR on 9/12/26.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var notifySwitch: UISwitch!
    
    @IBOutlet weak var roleSegmentedControl: UISegmentedControl!
    
    @IBAction func exploreButtonTapped(_ sender: UIButton)
    {
        nameTextField.resignFirstResponder()
        performSegue(withIdentifier: "ShowDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowDetailSegue",
              let destination = segue.destination as? DetailViewController else {
            return
        }
        let enteredName = nameTextField.text ?? ""
        destination.studentName = enteredName.isEmpty ? "Student" : enteredName
        destination.notificationsEnabled = notifySwitch.isOn
        destination.selectedRole = roleSegmentedControl.selectedSegmentIndex == 0
        ? "Student" : "Faculty"
    }
    
    
}
