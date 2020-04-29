//
//  ThingListViewModel.swift
//  FavouriteThings
//
//  Created by William Dower on 29/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import Foundation
import CoreData

extension ThingList {
    var thingsArray: [Thing] {
        (self.things?.array as? [Thing]) ?? []
    }
    var titleField: String {
        get {
            self.title ?? ""
        }
        set {
            self.title = newValue
        }
    }
    static func createNewList(context: NSManagedObjectContext, detailViewModel: DetailViewModel) -> ThingList {
        let thingList = ThingList(context: context)
        thingList.title = "Favourite Things"
        let thingOne = Thing(context: context)
        thingOne.imageURL = "https://i.imgur.com/znmt1bu.jpg"
        thingOne.getImage()
        thingOne.title = "Chandler Bing"
        thingOne.subtitle = "Friends Character"
        thingOne.fieldOneLabel = "Gender:"
        thingOne.fieldOne = "Male"
        thingOne.fieldTwoLabel = "Job:"
        thingOne.fieldTwo = "Transponster"
        thingOne.fieldThreeLabel = "Best Out of All the Friends:"
        thingOne.notesLabel = "Yes"
        thingOne.thingList = thingList
        
        let thingTwo = Thing(context: context)
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
        thingTwo.notesLabel = detailViewModel.defaultNotesLabel
        thingTwo.thingList = thingList
        
        let thingThree = Thing(context: context)
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
        thingThree.notesLabel = detailViewModel.defaultNotesLabel
        thingThree.thingList = thingList
        
        let thingFour = Thing(context: context)
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
        thingFour.notesLabel = detailViewModel.defaultNotesLabel
        thingFour.thingList = thingList
        
        return thingList
    }
}