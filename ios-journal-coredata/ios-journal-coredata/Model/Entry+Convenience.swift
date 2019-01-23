//
//  Entry+Convenience.swift
//  ios-journal-coredata
//
//  Created by David Doswell on 1/22/19.
//  Copyright © 2019 David Doswell. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    
    @discardableResult
    convenience init(title: String, bodyText: String, timestamp: Date, identifier: String, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
        self.identifier = identifier
    }
}
