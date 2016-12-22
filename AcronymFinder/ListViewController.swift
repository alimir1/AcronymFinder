//
//  ListViewController.swift
//  AcronymFinder
//
//  Created by Ali Mir on 12/21/16.
//  Copyright © 2016 com.AliMir. All rights reserved.
//

import UIKit
import MBProgressHUD

class ListViewController: UITableViewController {
    // MARK: - Properties
    var acronymInformations = [LongformObject]()
    
    // MARK: - Outlets
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - View Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getAcronymInfo(acronym: String) {
        MBProgressHUD.showAdded(to: self.navigationController!.view, animated: true)
        NactemClient.shared.getNactemObjects(from: acronym) {
            (data, error) in
            MBProgressHUD.hide(for: self.navigationController!.view, animated: false)
            if let error = error {
                let alertCtrl = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
                alertCtrl.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertCtrl, animated: true, completion: nil)
            }
            if let data = data {
                self.acronymInformations = data
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - TableView Setup

extension ListViewController {
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return acronymInformations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "fullFormOfAcronym", for: indexPath)
        cell.textLabel?.text = acronymInformations[indexPath.row].representativeFormOfFullForm
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "informationVC", sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - TextFieldDelegate

extension ListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        guard textField.text != "" else { return true }
        getAcronymInfo(acronym: textField.text!)
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.acronymInformations.removeAll()
        self.tableView.reloadData()
        return true
    }
}

// MARK: - Navigation

extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "informationVC" {
            let infoVC = segue.destination as! InformationViewController
            let indexPath = sender as! IndexPath
            infoVC.fullForm = acronymInformations[indexPath.row].representativeFormOfFullForm
            infoVC.numOcc = String(describing: acronymInformations[indexPath.row].numberOfOccurrencesInCorpus)
            infoVC.yearAppeared = String(describing: acronymInformations[indexPath.row].yearOfFirstTimeInCorpus)
        }
    }
}


