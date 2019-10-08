//
//  VocabularyTableViewController.swift
//  SwiftVocabulary
//
//  Created by John Pitts on 10/7/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

import UIKit

class VocabularyTableViewController: UITableViewController {
    
    
    var words: [Word] = [Word(name: "Delegate", definition: "An object, such as a viewController class, who acts as a supplier of information to a delegator object"), Word(name: "Protocol", definition: "Set of rules which governs how an object performs at its basest level"), Word(name: "Object", definition: "A property or collection of properties which make up an overall bigger entity, which we call an object.  Objects can be classes, structs, or properties (variables, constants)")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return words.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
        
        cell.textLabel?.text = words[indexPath.row].name
        
        return cell
    }


    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDefinitions" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let detailVC = segue.destination as? DefinitionViewController else { return }
            detailVC.word = words[indexPath.row]
            
        }
    }
    
}
