//
//  TableViewController.swift
//  TableViewExample
//
//  Created by Fatihan Ziyan on 8.05.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Property
    var scientists: [String] = [    "Ali Kuşçu",
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
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // sourceIndexPath : Sırası değiştirilmek istenen hücrenin konumu
        // destinationIndexPath : Gidilmesi istenen konum (Parmak ekrandan kaldırıldığı anda devreye giriyor)
        
        let moveScientist = scientists.remove(at: sourceIndexPath.row) // Hareket ettirilen cell nesnesine ulaşıp arrayden siliyorum.
        scientists.insert(moveScientist, at: destinationIndexPath.row) // Silinen eleman array'e yeni yerine ekleniyor.
        tableView.reloadData()
    }
    
    
    // MARK: - Actions
    
    @IBAction func editButtonTapped (_ button: UIBarButtonItem){
        
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }



}
