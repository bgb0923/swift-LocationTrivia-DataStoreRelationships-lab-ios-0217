//
//  LocationsTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by William Brancato on 3/7/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class LocationsTableViewController: UITableViewController {
 
    var store = LocationDataStore.sharedInstance
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        self.accessibilityLabel = "Locations Table"
        tableView.accessibilityLabel = "Locations Table"
        tableView.accessibilityIdentifier = "Locations Table"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.store.locations.count
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        cell.textLabel?.text = self.store.locations[indexPath.row].name
        cell.detailTextLabel?.text = String(self.store.locations[indexPath.row].trivia.count)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? TriviaTableViewController {
            let indexPath = tableView.indexPathForSelectedRow
            if let index = indexPath?.row {
                dest.location = self.store.locations[index]
            }
        }
    }
    
}
