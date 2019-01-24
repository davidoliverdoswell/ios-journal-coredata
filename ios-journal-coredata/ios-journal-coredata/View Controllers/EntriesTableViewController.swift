//
//  EntriesTableViewController.swift
//  ios-journal-coredata
//
//  Created by David Doswell on 1/22/19.
//  Copyright © 2019 David Doswell. All rights reserved.
//

import UIKit

class EntriesTableViewController: UITableViewController {
    
    let entryController = EntryController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryController.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EntryTableViewCell
        
        let entry = entryController.entries[indexPath.row]
        let formatter = DateFormatter()
        
        cell.titleLabel.text = entry.title
        cell.bodyTextLabel.text = entry.bodyText
        cell.timestampLabel.text = formatter.string(from: entry.timestamp!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = entryController.entries[indexPath.row]
            CoreDataStack.shared.mainContext.delete(entry)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! EntryDetailViewController
        if segue.identifier == "CreateEntry" {
            destinationVC.entryController = entryController
        } else if segue.identifier == "ShowEntry" {
            let indexPath = tableView.indexPathForSelectedRow!
            destinationVC.entry = entryController.entries[indexPath.row]
        }
    }
    

}
