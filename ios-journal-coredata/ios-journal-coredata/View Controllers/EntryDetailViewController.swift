//
//  EntryDetailViewController.swift
//  ios-journal-coredata
//
//  Created by David Doswell on 1/22/19.
//  Copyright © 2019 David Doswell. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
    
    var entryController: EntryController?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var entryTextField: UITextField!
    @IBOutlet weak var entryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (entryTextField.text?.isEmpty)! || entryTextView.text.isEmpty {
            navigationItem.rightBarButtonItem = nil
        } else {
            navigationItem.rightBarButtonItem = self.saveButton
        }
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        self.title = entry?.title ?? "Create Entry"
        entryTextField.text = entry?.title
        entryTextView.text = entry?.bodyText
    }
    
    @IBAction func saveEntry(_ sender: Any) {
        guard let title = entryTextField.text, let body = entryTextField.text else { return }
        
        guard let entry = entry else { return }
        
        if (entry.title?.isEmpty)! && (entry.bodyText?.isEmpty)! {
            entryController?.create(with: title, bodyText: body, timestamp: Date(), identifier: UUID().uuidString)
        } else {
            entryController?.update(entry: entry, title: title, bodyText: body)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
