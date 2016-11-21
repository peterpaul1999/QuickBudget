//
//  DatabaseModelController.swift
//  QuickBudget
//
//  Created by Thomas Karg on 19.11.16.
//  Copyright © 2016 Thomas Karg. All rights reserved.
//

import Foundation
import CoreData

class DatabaseModelController {
    
    private init () {
        
    }
    
    class func addCategory (name: String) {
        let category: Category = NSEntityDescription.insertNewObject(forEntityName: "Category", into: DatabaseController.getContext()) as! Category
        category.name = name
        DatabaseController.saveContext()
    }
    
    class func getGategories () -> [Category] {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        var searchResults: [Category] = []
        do {
            searchResults = try DatabaseController.getContext().fetch(fetchRequest)
        }
        catch {
            print("error")
        }
        return searchResults as [Category]
    }
    
    class func getShortItems () -> [ShortItem] {
        let fetchRequest: NSFetchRequest<ShortItem> = ShortItem.fetchRequest()
        var searchResults: [ShortItem] = []
        do {
            searchResults = try DatabaseController.getContext().fetch(fetchRequest)
        }
        catch {
            print("error")
        }
        return searchResults as [ShortItem]
    }
    
    class func clearCoreData () {
    
        print("Clear CoreData")
        print("Categories before: \(DatabaseModelController.getGategories().count)")
        print("ShortItems before: \(DatabaseModelController.getShortItems().count)")
        
        let fetchShortItem = NSFetchRequest<NSFetchRequestResult>(entityName: "ShortItem")
        let requestShortItem = NSBatchDeleteRequest(fetchRequest: fetchShortItem)
        do {
            try DatabaseController.getContext().execute(requestShortItem)
        } catch {
            print ("error")
        }
        
        let fetchCategory = NSFetchRequest<NSFetchRequestResult>(entityName: "Category")
        let requestCategory = NSBatchDeleteRequest(fetchRequest: fetchCategory)
        do {
            try DatabaseController.getContext().execute(requestCategory)
        } catch {
            print ("error")
        }
        
        print("Categories after: \(DatabaseModelController.getGategories().count)")
        print("ShortItems after: \(DatabaseModelController.getShortItems().count)")
    }
    
    class func initCoreData () {
        
        print("Init CoreData")
        print("Categories before: \(DatabaseModelController.getGategories().count)")
        print("ShortItems before: \(DatabaseModelController.getShortItems().count)")
        
        let url = Bundle.main.url(forResource: "categories", withExtension: "json")
        let data = NSData(contentsOf: url!) as? Data
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            
            let jsonArray = jsonResult.value(forKey: "category") as! [[String:Any]]
            
            for json in jsonArray {
                let category = NSEntityDescription.insertNewObject(forEntityName: "Category", into: DatabaseController.getContext()) as! Category
                category.name = json["name"] as? String
                
                let results = json["shortItem"] as! [[String:Any]]
                
                for result in results {
                    let shortItem = NSEntityDescription.insertNewObject(forEntityName: "ShortItem", into: DatabaseController.getContext()) as! ShortItem
                    
                    shortItem.desc = result["desc"] as? String
                    shortItem.price = result["price"] as? NSDecimalNumber
                    shortItem.category = category
                }
            }
            DatabaseController.saveContext()            
        } catch {
            fatalError("Error in uploading data")
        }
        
        print("Categories after: \(DatabaseModelController.getGategories().count)")
        print("ShortItems after: \(DatabaseModelController.getShortItems().count)")
    }

}
