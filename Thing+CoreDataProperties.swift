//
//  Thing+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by William Dower on 3/5/20.
//  Copyright © 2020 William Dower. All rights reserved.
//
//

import Foundation
import CoreData


extension Thing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thing> {
        return NSFetchRequest<Thing>(entityName: "Thing")
    }
    
    /// Stored field one of the thing.
    @NSManaged public var fieldOne: String?
    /// Stored field one label of the thing.
    @NSManaged public var fieldOneLabel: String?
    /// Stored field two of the thing.
    @NSManaged public var fieldTwo: String?
    /// Stored field two label of the thing.
    @NSManaged public var fieldTwoLabel: String?
    /// Stored field three of the thing.
    @NSManaged public var fieldThree: String?
    /// Stored field three label of the thing.
    @NSManaged public var fieldThreeLabel: String?
    /// Stored imageURL used to get the image for the thing.
    @NSManaged public var imageURL: String?
    /// Stored notes field for the thing.
    @NSManaged public var notes: String?
    /// Stored label for the notes field of the thing.
    @NSManaged public var notesLabel: String?
    /// Stored subtitle for the thing.
    @NSManaged public var subtitle: String?
    /// Stored title for the thing
    @NSManaged public var title: String?
    /// Stored id for the thing, used to save the thing's image to the file system
    @NSManaged public var id: UUID?
    /// Stored bool for whether the thing's URL holds a valid image that can be downloaded.
    @NSManaged public var successfulURL: Bool
    /// The thingList that the thing is stored in.
    @NSManaged public var thingList: ThingList?

}
