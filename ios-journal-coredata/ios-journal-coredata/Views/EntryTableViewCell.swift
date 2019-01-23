//
//  EntryTableViewCell.swift
//  ios-journal-coredata
//
//  Created by David Doswell on 1/22/19.
//  Copyright © 2019 David Doswell. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }

    private func updateViews() {
        guard let title = titleLabel.text else { return }
        guard let bodyText = bodyTextLabel.text else { return }
        guard let timestamp = timestampLabel.text else { return }
        
        entry?.title = title
        entry?.bodyText = bodyText
        entry?.timestamp = formatter.date(from: timestamp)
    }

    private let formatter = DateFormatter()
}
