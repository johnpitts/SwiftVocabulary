//
//  VocabularyTableViewController.swift
//  SwiftVocabulary
//
//  Created by John Pitts on 10/7/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

import UIKit

class VocabularyTableViewController: UITableViewController {
    
    // This is nice bc no matter what the user gets 3 definitions for free at the start of the app, without having to persist.  This would be sort've an "array literal"
    var words: [Word] = [Word(name: "Delegate", definition: "An object, such as a viewController class, who acts as a supplier of information to a delegator object"), Word(name: "Protocol", definition: "Set of rules which governs how an object performs at its basest level"), Word(name: "Object", definition: "A property or collection of properties which make up an overall bigger entity, which we call an object.  Objects can be classes, structs, or properties (variables, constants)")]
    
    var alertController: UIAlertController?

    
    
    @IBAction func addWordButtonTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Add New Vocab. Word", message: "add details", preferredStyle: .alert)
        alertController.addTextField()
        alertController.textFields![0].placeholder = "Enter Vocabulary Word"
        alertController.addTextField()
        alertController.textFields![1].placeholder = "Enter Definition"

        let saveAction = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            // NOTE: textFields comes as a free array as part of UIAlertController
            let newestWord = alertController.textFields![0]
            let newestDefinition = alertController.textFields![1]
            
            let latestWord = Word(name: newestWord.text ?? "user made nil entry", definition: newestDefinition.text ?? "delete this entry")
            self.words.append(latestWord)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

        }  // end saveAction
        alertController.addAction(saveAction)
        present(alertController, animated: true)
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
