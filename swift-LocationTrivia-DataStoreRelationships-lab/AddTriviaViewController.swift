//
//  AddTriviaViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by William Brancato on 3/7/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class AddTriviaViewController: UIViewController {
    
    var location: Location?
    
    @IBOutlet weak var triviaText: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButon: UIButton!
    
    
    @IBAction func saveAction(_ sender: UIButton) {
        guard let trivia = triviaText.text else { return }
        let trivium = Trivium(content: trivia, likes: 0)
        location?.trivia.append(trivium)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
