//
//  TableViewController.swift
//  TableViewExample
//
//  Created by Fatihan Ziyan on 8.05.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Property
    var scientists: [Scientist] = [ Scientist(name: "İlber Ortaylı", desctiption: "Tarihçi"),
                                    Scientist(name: "Oktay Sinanoğlu", desctiption: "Bilim Adamı"),
                                    Scientist(name: "Aziz Sancar", desctiption: "Bilim Adamı"),
                                    Scientist(name: "Mehmet Öz", desctiption: "Tıp Doktoru"),
                                    Scientist(name: "Cahit Arf", desctiption: "Bilim İnsanı - Fizikçi ve Kimyacı"),
                                    Scientist(name: "Albert Einstein", desctiption: "Bilim Adamı"),
                                    Scientist(name: "Niels Bohr", desctiption: "Bilim Adamı - Atom Fiziği"),
                                    Scientist(name: "Stephen Hawking", desctiption: "Bilim Adamı - Kuramsal Fizik"),
                                    Scientist(name: "Muazzez İlmiye Çığ", desctiption: "Bilim İnsanı - Arkeolog"),
                                    Scientist(name: "Stephen Hawking", desctiption: "Bilim Adamı - Fizik"),
                                    Scientist(name: "Charles Darwin", desctiption: "Bilim Adamı"),
                                    Scientist(name: "Ali Kuşçu", desctiption: "Bilim Adamı - Astronomi"),
                                    Scientist(name: "Feza Gürsey", desctiption: "Bilim Adamı"),
                                    Scientist(name: "Pîrî Reis", desctiption: "Denizci ve kartograf"),
                                    Scientist(name: "Fârâbî", desctiption: "Gök bilimci, mantıkçı ve müzisyendir"),]

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
            cell.textLabel?.text = "\(scientist.name)"
            cell.detailTextLabel?.text = "\(scientist.desctiption)"
            
            return cell

    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedScientist = scientists[indexPath.row]
        //print("\(selectedScientist.description) \(indexPath)")
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // sourceIndexPath : Sırası değiştirilmek istenen hücrenin konumu
        // destinationIndexPath : Gidilmesi istenen konum (Parmak ekrandan kaldırıldığı anda devreye giriyor)
        
        let moveScientist = scientists.remove(at: sourceIndexPath.row) // Hareket ettirilen cell nesnesine ulaşıp arrayden siliyorum.
        scientists.insert(moveScientist, at: destinationIndexPath.row) // Silinen eleman array'e yeni yerine ekleniyor.
        tableView.reloadData()
    }
    
    // fonksiyon içerisinde cell delete işlemi yapılıyor.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // indexpath editing işlemi gerçekleşen cell
        // editing style aksiyonu .insert ve .delete olabilir.
        
        if editingStyle == .delete {
            scientists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    // MARK: - Actions
    
    @IBAction func editButtonTapped (_ button: UIBarButtonItem){
        
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    // Bu fonksiyon NewScientistTableViewController tarafından çalıştırılacak.
    @IBAction func unwindFromNewScientist(_segue: UIStoryboardSegue){
        
        // Tetiklenen segue'nin 'save' olduğunu test eden function.
        guard _segue.identifier == "saveUnwind",
              let sourceViewController = _segue.source as? NewScientistTableViewController,
              let newScient = sourceViewController.scientist else { return }
        
        let newIndexPath = IndexPath(row: scientists.count, section: 0) // yeni bir hücre için indexPath oluşturuyor
        scientists.append(newScient)
        tableView.insertRows(at: [newIndexPath], with: .automatic)  //Oluşan IndexPath ve TAbleViw'a yeni hücre ekler
        
        
    }



}
