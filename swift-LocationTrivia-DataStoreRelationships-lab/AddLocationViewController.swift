//
//  AddLocationViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by William Brancato on 3/7/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class AddLocationViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        self.saveButton.accessibilityIdentifier = "saveButton"
        self.saveButton.accessibilityLabel = "saveButton"
        self.cancelButton.accessibilityIdentifier = "cancelButton"
        self.cancelButton.accessibilityLabel = "cancelButton"
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "addButton"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "addButton"
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        guard let name = self.nameField.text else { return }
        guard let latitude = self.latitudeField.text else { return }
        guard let latitudeFloat = Float(latitude) else { return }
        guard let longitude = self.longitudeField.text  else { return }
        guard let longitudeFloat = Float(longitude) else { return }
        LocationDataStore.sharedInstance.locations.append(Location(name: name, latitude: latitudeFloat, longitude: longitudeFloat))
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
