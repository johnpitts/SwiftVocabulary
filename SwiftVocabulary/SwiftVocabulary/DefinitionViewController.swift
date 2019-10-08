//
//  DefinitionViewController.swift
//  SwiftVocabulary
//
//  Created by John Pitts on 10/7/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var definitionTextView: UITextView!
    
    
    var word: Word?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    private func updateViews() {
        
        guard let word = word else { return }
        wordLabel.text = word.name
        print(word.definition)
        definitionTextView.text = word.definition
    }

}
