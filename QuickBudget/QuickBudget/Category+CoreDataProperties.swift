//
//  Category+CoreDataProperties.swift
//  QuickBudget
//
//  Created by Thomas Karg on 19.11.16.
//  Copyright © 2016 Thomas Karg. All rights reserved.
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category");
    }

    @NSManaged public var name: String?
    @NSManaged public var item: NSSet?
    @NSManaged public var shortItem: NSSet?

}

// MARK: Generated accessors for item
extension Category {

    @objc(addItemObject:)
    @NSManaged public func addToItem(_ value: Item)

    @objc(removeItemObject:)
    @NSManaged public func removeFromItem(_ value: Item)

    @objc(addItem:)
    @NSManaged public func addToItem(_ values: NSSet)

    @objc(removeItem:)
    @NSManaged public func removeFromItem(_ values: NSSet)

}

// MARK: Generated accessors for shortItem
extension Category {

    @objc(addShortItemObject:)
    @NSManaged public func addToShortItem(_ value: ShortItem)

    @objc(removeShortItemObject:)
    @NSManaged public func removeFromShortItem(_ value: ShortItem)

    @objc(addShortItem:)
    @NSManaged public func addToShortItem(_ values: NSSet)

    @objc(removeShortItem:)
    @NSManaged public func removeFromShortItem(_ values: NSSet)

}
