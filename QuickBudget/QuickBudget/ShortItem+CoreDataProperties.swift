//
//  ShortItem+CoreDataProperties.swift
//  QuickBudget
//
//  Created by Thomas Karg on 21.11.16.
//  Copyright © 2016 Thomas Karg. All rights reserved.
//

import Foundation
import CoreData


extension ShortItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShortItem> {
        return NSFetchRequest<ShortItem>(entityName: "ShortItem");
    }

    @NSManaged public var desc: String?
    @NSManaged public var price: Double
    @NSManaged public var category: Category?

}
