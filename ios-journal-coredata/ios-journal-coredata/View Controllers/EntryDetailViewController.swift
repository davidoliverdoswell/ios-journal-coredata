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
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        self.title = entry?.title ?? "Create Entry"
        entryTextField.text = entry?.title
        entryTextView.text = entry?.bodyText
        
        let priority = entry?.entryPriority ?? .happy
        let priorityIndex = EntryPriority.allCases.index(of: priority)!
        prioritySegmentedControl.selectedSegmentIndex = priorityIndex
    }
    
    @IBAction func saveEntry(_ sender: Any) {
        
        let priorityIndex = prioritySegmentedControl.selectedSegmentIndex
        let mood = EntryPriority.allCases[priorityIndex]
        
        guard let title = entryTextField.text, let body = entryTextView.text else { return }
        
        if let entry = entry {
            entryController?.update(entry: entry, title: title, bodyText: body, mood: mood.rawValue)
        } else {
             entryController?.create(with: title, bodyText: body, timestamp: Date(), identifier: UUID().uuidString, mood: mood.rawValue)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
