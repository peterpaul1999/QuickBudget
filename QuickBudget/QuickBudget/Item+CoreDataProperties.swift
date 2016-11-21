//
//  Item+CoreDataProperties.swift
//  QuickBudget
//
//  Created by Thomas Karg on 19.11.16.
//  Copyright © 2016 Thomas Karg. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var desc: String?
    @NSManaged public var price: NSDecimalNumber?
    @NSManaged public var category: Category?

}
