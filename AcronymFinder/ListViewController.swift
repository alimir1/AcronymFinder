//
//  ListViewController.swift
//  AcronymFinder
//
//  Created by Ali Mir on 12/21/16.
//  Copyright © 2016 com.AliMir. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var acronymInformations = [LongformObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NactemClient.shared.getNactemObjects(from: "23lksdlk") {
            (data, error) in
            if let error = error {
                // FIXME: - Present error model (localized error) whenever an error occurs.
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return acronymInformations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.tableView.dequeueReusableCell(withIdentifier: "fullFormOfAcronym", for: indexPath)
    }
}
