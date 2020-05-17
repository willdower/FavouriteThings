//
//  ThingListViewModel.swift
//  FavouriteThings
//
//  Created by William Dower on 29/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

/// Extends ThingList and adds the ViewModel operations.
extension ThingList {
    /// Holds all models in an array rather than a ThingList for easier access.
    var thingsArray: [Thing] {
        (self.things?.array as? [Thing]) ?? []
    }
    /// Provides a getter and setter for changing the title of the list.
    var titleField: String {
        get {
            self.title ?? ""
        }
        set {
            self.title = newValue
        }
    }
    /// Creates a new ThingList in the context and adds four pre-populated default things.
    ///
    /// - Parameters:
    ///     - context: The CoreData context for the ThingList
    ///     - detailViewModel: The DetailViewModel being used by the app.
    ///
    /// - Returns: ThingList
    ///
    /// - Note:Constant strings  not in the detailViewModel are used here only because these are for testing - in a proper deployment, these would not be used.
    static func createNewList(context: NSManagedObjectContext, detailViewModel: DetailViewModel) -> ThingList {
        let thingList = ThingList(context: context)
        thingList.title = "Favourite Things"
        let thingOne = Thing(context: context)
        thingOne.id = UUID()
        thingOne.imageURL = "https://i.imgur.com/znmt1bu.jpg"
        thingOne.getImage()
        thingOne.title = "Chandler Bing"
        thingOne.subtitle = "Friends Character"
        thingOne.fieldOneLabel = "Gender:"
        thingOne.fieldOne = "Male"
        thingOne.fieldTwoLabel = "Job:"
        thingOne.fieldTwo = "Transponster"
        thingOne.fieldThreeLabel = "Best Of All the Friends:"
        thingOne.fieldThree = "Yes"
        thingOne.locationLabel = "Location:"
        thingOne.locationNameLabel = "Location Name:"
        thingOne.latitudeLabel = "Latitude:"
        thingOne.latitude = 40.712776
        thingOne.longitudeLabel = "Longitude:"
        thingOne.longitude = -74.005974
        thingOne.notesLabel = detailViewModel.defaultNotesLabel
        detailViewModel.getLocationFromCoordinates(model: thingOne)
        thingOne.thingList = thingList
        
        let thingTwo = Thing(context: context)
        thingTwo.id = UUID()
        thingTwo.imageURL = "https://i.imgur.com/hDE2TIm.jpg"
        thingTwo.getImage()
        thingTwo.title = "Minecraft"
        thingTwo.subtitle = "Mojang"
        thingTwo.fieldOneLabel = "Release Date:"
        thingTwo.fieldOne = "17/5/2009"
        thingTwo.fieldTwoLabel = "User Rating:"
        thingTwo.fieldTwo = "8.1"
        thingTwo.fieldThreeLabel = "Critic Rating:"
        thingTwo.fieldThree = "93"
        thingTwo.locationLabel = "Location:"
        thingTwo.locationNameLabel = "Location Name:"
        thingTwo.latitudeLabel = "Latitude:"
        thingTwo.latitude = 60.128162
        thingTwo.longitudeLabel = "Longitude:"
        thingTwo.longitude = 18.643501
        thingTwo.notesLabel = detailViewModel.defaultNotesLabel
        detailViewModel.getLocationFromCoordinates(model: thingTwo)
        thingTwo.thingList = thingList
        
        let thingThree = Thing(context: context)
        thingThree.id = UUID()
        thingThree.imageURL = "https://i.imgur.com/buKG2h2.jpg"
        thingThree.getImage()
        thingThree.title = "Red Dead Redemption 2"
        thingThree.subtitle = "Rockstar Games"
        thingThree.fieldOneLabel = "Release Date"
        thingThree.fieldOne = "26/10/2018"
        thingThree.fieldTwoLabel = "User Rating:"
        thingThree.fieldTwo = "8.1"
        thingThree.fieldThreeLabel = "Critic Rating:"
        thingThree.fieldThree = "97"
        thingThree.locationLabel = "Location:"
        thingThree.locationNameLabel = "Location Name:"
        thingThree.latitudeLabel = "Latitude:"
        thingThree.latitude = 55.953251
        thingThree.longitudeLabel = "Longitude:"
        thingThree.longitude = -3.188267
        thingThree.notesLabel = detailViewModel.defaultNotesLabel
        detailViewModel.getLocationFromCoordinates(model: thingThree)
        thingThree.thingList = thingList
        
        let thingFour = Thing(context: context)
        thingFour.id = UUID()
        thingFour.imageURL = "https://i.imgur.com/ZKqwV6e.jpg"
        thingFour.getImage()
        thingFour.title = "Pear"
        thingFour.subtitle = "Cool Food"
        thingFour.fieldOneLabel = "Colour:"
        thingFour.fieldOne = "Green"
        thingFour.fieldTwoLabel = "Fruit or Vegetable?"
        thingFour.fieldTwo = "Fruit"
        thingFour.fieldThreeLabel = "Is it spicy?"
        thingFour.fieldThree = "No"
        thingFour.locationLabel = "Location:"
        thingFour.locationNameLabel = "Location Name:"
        thingFour.latitudeLabel = "Latitude:"
        thingFour.latitude = -28.016666
        thingFour.longitudeLabel = "Longitude:"
        thingFour.longitude = 153.399994
        thingFour.notesLabel = detailViewModel.defaultNotesLabel
        detailViewModel.getLocationFromCoordinates(model: thingFour)
        thingFour.thingList = thingList
        
        return thingList
    }
    
    /// Creates a new Thing in the context and saves it to CoreData
    ///
    /// - Parameters:
    ///     - context: The CoreData context for the Thing
    ///     - detailViewModel: The DetailViewModel being used by the app.
    static func createNewThing(context: NSManagedObjectContext, detailViewModel: DetailViewModel, thingList: FetchedResults<ThingList>) {
        
        let thing = Thing(context: context)
        thing.id = UUID()
        thing.title = detailViewModel.unknownLabel
        thing.subtitle = detailViewModel.unknownLabel
        thing.fieldOneLabel = detailViewModel.defaultFieldOneLabel
        thing.fieldTwoLabel = detailViewModel.defaultFieldTwoLabel
        thing.fieldThreeLabel = detailViewModel.defaultFieldThreeLabel
        thing.locationLabel = detailViewModel.defaultLocationLabel
        thing.locationNameLabel = detailViewModel.defaultLocationNameLabel
        thing.latitudeLabel = detailViewModel.defaultLatitudeLabel
        thing.longitudeLabel = detailViewModel.defaultLongitudeLabel
        thing.notesLabel = detailViewModel.defaultNotesLabel
        thing.thingList = thingList.first
        do {
            try context.save()
            print("Saved new item to CoreData")
        }
        catch {
            let cannotSaveError = error as NSError
            print("Failed to save new item to CoreData")
            print("\(cannotSaveError): \(cannotSaveError.userInfo)")
        }
    }
    
    func moveThings(indices: IndexSet, destination: Int) {
        /* Weird issue where an item could be moved up the order fine but moving down would take it down one too many
        // Fixed by subtracting 1 from destination position if item is moving down
        // Solution is a little bit hacky but it works
        // Can't tell if the problem is from the use of incorrect functions on my part or if it is related to the
        // combined use of SwiftUI's onMove with non-SwiftUI NSMutableOrderedSet's moveObjects function */
        let itemToMove = indices.first
        if (itemToMove ?? 0 < destination) {
            let exchange: NSMutableOrderedSet = self.things?.mutableCopy() as! NSMutableOrderedSet
            exchange.moveObjects(at: indices, to: destination-1)
            self.things = exchange
        }
        else {
            let exchange: NSMutableOrderedSet = self.things?.mutableCopy() as! NSMutableOrderedSet
            exchange.moveObjects(at: indices, to: destination)
            self.things = exchange
        }
    }
}
