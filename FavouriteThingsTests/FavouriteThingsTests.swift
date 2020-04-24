//
//  FavouriteThingsTests.swift
//  FavouriteThingsTests
//
//  Created by William Dower on 22/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import XCTest
import SwiftUI
import Foundation
@testable import FavouriteThings

/// This class holds all the tests for the FavouriteThings program.
class FavouriteThingsTests: XCTestCase {
    
    /// The title string for testing.
    private var title: String!
    /// The image URL for testing.
    private var imageURL: String!
    /// The subtitle used for testing.
    private var subtitle: String!
    /// The fieldOne string used for testing.
    private var fieldOne: String!
    /// The fieldTwo string used for testing.
    private var fieldTwo: String!
    /// The fieldThree string used for testing.
    private var fieldThree: String!
    /// The fieldOneLabel string used for testing.
    private var fieldOneLabel: String!
    /// The fieldTwoLabel string used for testing.
    private var fieldTwoLabel: String!
    /// The fieldThreeLabel string used for testing.
    private var fieldThreeLabel: String!
    /// The itemViewModels object used for testing.
    private var itemViewModels: ItemViewModels!

    /// Sets up for the testing.
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.title = "Test Object"
        self.imageURL = "https://i.imgur.com/Nkqztzw.jpg"
        self.subtitle = "Object"
        self.fieldOneLabel = "Is this a test?"
        self.fieldOne = "Yes"
        self.fieldTwoLabel = "Date Added:"
        self.fieldTwo = "22/4/2020"
        self.fieldThreeLabel = "Hotel:"
        self.fieldThree = "Trivago"
        
        self.itemViewModels = ItemViewModels()
        self.itemViewModels.addItem(Model(title: self.title, imageURL: self.imageURL, subtitle: self.subtitle, fieldOneLabel: self.fieldOneLabel, fieldOne: self.fieldOne, fieldTwoLabel: self.fieldTwoLabel, fieldTwo: self.fieldTwo, fieldThreeLabel: self.fieldThreeLabel, fieldThree: self.fieldThree))
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Tests the title of the model.
    func testTitle() {
        XCTAssertEqual(itemViewModels.models[4].title, title)
    }
    
    /// Tests the image of the model.
    func testImage() {
        XCTAssertNotNil(itemViewModels.models[4].image) //Need to add resizable in assertion too
    }
    
    /// Tests the subtitle of the model.
    func testSubtitle() {
        XCTAssertEqual(itemViewModels.models[4].subtitle, subtitle)
    }
    
    /// Tests field one of the model
    func testFieldOne() {
        XCTAssertEqual(itemViewModels.models[4].fieldOne, fieldOne)
    }
    
    /// Tests the field one label of the model.
    func testFieldOneLabel() {
        XCTAssertEqual(itemViewModels.models[4].fieldOneLabel, fieldOneLabel)
    }
    
    /// Tests field two of the model.
    func testFieldTwo() {
        XCTAssertEqual(itemViewModels.models[4].fieldTwo, fieldTwo)
    }
    
    /// Tests the field two label of the model.
    func testFieldTwoLabel() {
        XCTAssertEqual(itemViewModels.models[4].fieldTwoLabel, fieldTwoLabel)
    }
    
    /// Tests field three of the model.
    func testFieldThree() {
        XCTAssertEqual(itemViewModels.models[4].fieldThree, fieldThree)
    }
    
    /// Tests the field three label of the model.
    func testFieldThreeLabel() {
        XCTAssertEqual(itemViewModels.models[4].fieldThreeLabel, fieldThreeLabel)
    }
    
    /// Tests the ItemViewModel objects are created properly.
    func testItemViewModels() {
        itemViewModels.addItem(Model(title: "Test Object 2", imageURL: "https://i.imgur.com/Nkqztzw.jpg", subtitle: "Tested 2", fieldOneLabel: "Testing:", fieldOne: "True", fieldTwoLabel: "Num:", fieldTwo: "One", fieldThreeLabel: "Is Don", fieldThree: "Is Good"))
        
        XCTAssertEqual(itemViewModels.models.count, 6) // Default 4 plus 1 added at setup and 1 added above
        XCTAssertEqual(itemViewModels.models[0].title, "Chandler Bing")
        XCTAssertEqual(itemViewModels.models[4].title, "Test Object")
        XCTAssertEqual(itemViewModels.models[5].title, "Test Object 2")
        XCTAssertEqual(itemViewModels.models[4].fieldThree, "Trivago")
        XCTAssertEqual(itemViewModels.models[5].fieldTwo, "One")
    }
    
    /// Tests that model data is successfully saved to file and can be read from that file.
    func testSaveToFile() {
        
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentFolderURL = urls[0]
        let fileURL = documentFolderURL.appendingPathComponent("models.json")
        
        do {
            let json = JSONEncoder()
            let data = try json.encode(itemViewModels)
            try data.write(to: fileURL)
            print("Saved to \(fileURL.path)")
        }
        catch {
            print("Write failed to: \(fileURL.path), \(error)")
            XCTFail() // Instantly fail if this is reached
        }
        
        do {
            let t = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let newItemViewModels = try decoder.decode(ItemViewModels.self, from: t)
            print("Successfully loaded from file at \(fileURL.path)")
            
            XCTAssertEqual(newItemViewModels.models[0].title, "Chandler Bing")
        }
        catch {
            print("Failed to load from file")
            XCTFail() // Instantly fail if this is reached
        }
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
