//
//  EntryController.swift
//  ios-journal-coredata
//
//  Created by David Doswell on 1/22/19.
//  Copyright © 2019 David Doswell. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    var entries: [Entry] {
        return loadFromPersistentStore()
    }
    
    func create(with title: String, bodyText: String, timestamp: Date, identifier: String, mood: String = "😐") {
        
        let entry = Entry(title: title, bodyText: bodyText, timestamp: timestamp, identifier: identifier, mood: mood)
        
        entry.title = title
        entry.bodyText = bodyText
        entry.timestamp = timestamp
        entry.identifier = identifier
        entry.mood = mood
        
        saveToPersistentStore()
    }
    
    func update(entry: Entry, title: String, bodyText: String, mood: String) {
        entry.title = title
        entry.bodyText = bodyText
        entry.timestamp = Date()
        entry.mood = mood
        
        saveToPersistentStore()
    }
    
    func delete(entry: Entry) {
        CoreDataStack.shared.mainContext.delete(entry)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch {
            NSLog("Failed to save entry in context: \(error)")
        }
    }
    
    func loadFromPersistentStore() -> [Entry] {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        
        do {
            var results = [Entry]()
            CoreDataStack.shared.mainContext.performAndWait {
                results = (try? fetchRequest.execute()) ?? []
            }
            return results
        }
    }
    
    
    
    
}
