//
//  NewScientistTableViewController.swift
//  TableViewExample
//
//  Created by Fatihan Ziyan on 9.05.2023.
//

import UIKit

class NewScientistTableViewController: UITableViewController {
    
    @IBOutlet var scientistTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!

    
    var scientist: Scientist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let scientistName = scientistTextField.text!
        let descriptionName = descriptionTextField.text!
        scientist = Scientist(name: scientistName, desctiption: descriptionName)
        
    }


}
