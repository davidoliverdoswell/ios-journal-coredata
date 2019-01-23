//
//  EntryDetailViewController.swift
//  ios-journal-coredata
//
//  Created by David Doswell on 1/22/19.
//  Copyright © 2019 David Doswell. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var entryTextField: UITextField!
    @IBOutlet weak var entryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (entryTextField.text?.isEmpty)! || entryTextView.text.isEmpty {
            navigationItem.rightBarButtonItem = nil
        } else {
            navigationItem.rightBarButtonItem = self.saveButton
        }
    }
    
    @IBAction func saveEntry(_ sender: Any) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
}
