//
//  ThingList+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by William Dower on 3/5/20.
//  Copyright © 2020 William Dower. All rights reserved.
//
//

import Foundation
import CoreData


extension ThingList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ThingList> {
        return NSFetchRequest<ThingList>(entityName: "ThingList")
    }
    /// The title of the list of things.
    @NSManaged public var title: String?
    /// The set of things stored in CoreData.
    @NSManaged public var things: NSOrderedSet?

}

// MARK: Generated accessors for things
extension ThingList {

    @objc(insertObject:inThingsAtIndex:)
    @NSManaged public func insertIntoThings(_ value: Thing, at idx: Int)

    @objc(removeObjectFromThingsAtIndex:)
    @NSManaged public func removeFromThings(at idx: Int)

    @objc(insertThings:atIndexes:)
    @NSManaged public func insertIntoThings(_ values: [Thing], at indexes: NSIndexSet)

    @objc(removeThingsAtIndexes:)
    @NSManaged public func removeFromThings(at indexes: NSIndexSet)

    @objc(replaceObjectInThingsAtIndex:withObject:)
    @NSManaged public func replaceThings(at idx: Int, with value: Thing)

    @objc(replaceThingsAtIndexes:withThings:)
    @NSManaged public func replaceThings(at indexes: NSIndexSet, with values: [Thing])

    @objc(addThingsObject:)
    @NSManaged public func addToThings(_ value: Thing)

    @objc(removeThingsObject:)
    @NSManaged public func removeFromThings(_ value: Thing)

    @objc(addThings:)
    @NSManaged public func addToThings(_ values: NSOrderedSet)

    @objc(removeThings:)
    @NSManaged public func removeFromThings(_ values: NSOrderedSet)

}
