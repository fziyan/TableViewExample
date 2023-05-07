//
//  TableViewController.swift
//  TableViewExample
//
//  Created by Fatihan Ziyan on 8.05.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    let scientists: [String] = [    "Ali Kuşçu",
                                    "Aziz Sancar",
                                    "Cahit Arf",
                                    "Piri Reis",
                                    "Katip Çelebi",
                                    "Hezarfen Ahmet Çelebi",
                                    "Farabi",
                                    "Feza Gürsoy",
                                    "Katip Çelebi",
                                    "Piri Reis",
                                    "Akşemsettin",
                                    "Ali Erdemir",
                                    "Hulusi Behçet",
                                    "Oktay Sinanoğlu",
                                    "Celal Şengör","Afet İnan",
                                    "Behram Kurşunoğlu",
                                    "Tahsin Özgüç",
                                    "Mehmet Öz",
                                    "Şerif Mardin"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return scientists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let scientist = scientists[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScientistCell")!
            cell.textLabel?.text = "\(scientist)"
            cell.detailTextLabel?.text = "\(scientist)"
            
            return cell

    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedScientist = scientists[indexPath.row]
        print("\(selectedScientist.description) \(indexPath)")
    }
    
    // MARK: - Actions
    
    @IBAction func editButtonTapped (_ button: UIBarButtonItem){
        
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }



}
