//
//  TriviaTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by William Brancato on 3/7/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class TriviaTableViewController: UITableViewController {
    
    var location: Location!
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        tableView.accessibilityIdentifier = "Trivia Table"
        tableView.accessibilityLabel = "Trivia Table"
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.location.trivia.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TriviaCell", for: indexPath)
        cell.textLabel?.text = self.location.trivia[indexPath.row].content
        cell.detailTextLabel?.text = String(self.location.trivia[indexPath.row].likes)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? AddTriviaViewController {
            dest.location = self.location
        }
    }
}
