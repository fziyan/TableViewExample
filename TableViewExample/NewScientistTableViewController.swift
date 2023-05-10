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
        
        // Önceki sayfadan bir scientist objesi iletildiyse burda kontrol yapılır ilgili fieldlara basılıyor.
        if let scientist = scientist {
            scientistTextField.text = scientist.name
            descriptionTextField.text = scientist.desctiption
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "saveUnwind" else { return }
        
        if !scientistTextField.text!.isEmpty && !descriptionTextField.text!.isEmpty {
            
            let scientistName = scientistTextField.text!
            let descriptionName = descriptionTextField.text!
            scientist = Scientist(name: scientistName, desctiption: descriptionName)
        }
        else{
            // pop-up uyarısı eklenecek.
            print("Boş kayıt yapamazsın!. Lütfen bir değer giriniz..")
        }
      
        
    }


}
