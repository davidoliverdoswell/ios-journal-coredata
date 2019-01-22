//
//  CoreDataStack.swift
//  ios-journal-coredata
//
//  Created by David Doswell on 1/22/19.
//  Copyright © 2019 David Doswell. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    let mainContext: NSManagedObjectContext
    
    init() {
        let container = NSPersistentContainer(name: "Entry")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Couldn't load data store: \(error)")
            }
        }
        
        mainContext = container.viewContext
    }
    
}
