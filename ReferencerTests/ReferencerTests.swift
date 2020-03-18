//
//  ReferencerTests.swift
//  ReferencerTests
//
//  Created by William Dower on 4/3/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import XCTest
import SwiftUI
@testable import Referencer

class ReferencerTests: XCTestCase {
    
    private var title: String!
    private var imageName: String!
    private var developer: String!
    private var releaseYear: Int!
    private var releaseMonth: Int!
    private var releaseDay: Int!
    private var userRating: Float!
    private var criticRating: Int!
    private var game: VideoGame!
    private var gameViewModel: GameDetailViewModel!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.title = "Minecraft"
        self.imageName = "minecraftArt"
        self.developer = "Mojang"
        self.releaseYear = 2009
        self.releaseMonth = 5
        self.releaseDay = 17
        self.userRating = 7.7
        self.criticRating = 93
        
        //let game = VideoGame(title: "Minecraft", imageName: "minecraftArt", developer: "Mojang", releaseYear: 2009, releaseMonth: 5, releaseDay: 17, userRating: 7.7, criticRating: 93)
        
        self.game = VideoGame(title: title, imageName: imageName, developer: developer, releaseYear: releaseYear, releaseMonth: releaseMonth, releaseDay: releaseDay, userRating: userRating, criticRating: criticRating)
        self.gameViewModel = GameDetailViewModel(game: game)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTitle() {
        //This function tests the title is assigned properly during VideoGame init()
        XCTAssertEqual(game.title, title)
    }
    
    func testBoxArt() {
        //This function tests the image is assigned properly during VideoGame init() and is created from the given string properly
        XCTAssertEqual(game.boxArt, Image(imageName))
    }
    
    func testDeveloper() {
        //This function tests the developer is assigned properly during VideoGame init()
        XCTAssertEqual(game.developer, developer)
    }
    
    func testReleaseDate() {
        //This function tests the release date is assigned properly during VideoGame init() and is properly generated from its components
        var dc = DateComponents()
        dc.year = releaseYear
        dc.month = releaseMonth
        dc.day = releaseDay
        
        let releaseDate = Calendar.current.date(from: dc)
        
        XCTAssertEqual(game.releaseDate, releaseDate)
    }
    
    func testUserRating() {
        //This function tests the user rating is assigned properly during VideoGame init()
        XCTAssertEqual(game.userRating, userRating)
    }
    
    func testCriticRating() {
        //This function tests the critic rating is assigned properly during VideoGame init()
        XCTAssertEqual(game.criticRating, criticRating)
    }
    
    func testNilValuesAtModel() {
        let title = "Minecraft"
        let imageName: String? = nil
        let developer: String? = nil
        let releaseYear: Int? = nil
        let releaseMonth: Int? = nil
        let releaseDay: Int? = nil
        let userRating: Float? = nil
        let criticRating: Int? = nil
        
        let game = VideoGame(title: title, imageName: imageName, developer: developer, releaseYear: releaseYear, releaseMonth: releaseMonth, releaseDay: releaseDay, userRating: userRating, criticRating: criticRating)
        
        XCTAssertNotNil(game.title)
        
        //No other tests necessary, as nils handled on viewmodel level
        //If test successfully completes, nils handled properly
    }
    
    func testNilValuesAtViewModel() {
        let title = "Minecraft"
        let imageName: String? = nil
        let developer: String? = nil
        let releaseYear: Int? = nil
        let releaseMonth: Int? = nil
        let releaseDay: Int? = nil
        let userRating: Float? = nil
        let criticRating: Int? = nil
        
        let game = VideoGame(title: title, imageName: imageName, developer: developer, releaseYear: releaseYear, releaseMonth: releaseMonth, releaseDay: releaseDay, userRating: userRating, criticRating: criticRating)
        
        let gameViewModel = GameDetailViewModel(game: game)
        
        XCTAssertNotNil(gameViewModel.title)
        
        XCTAssertEqual(gameViewModel.image, Image("placeholderArt"))
        XCTAssertEqual(gameViewModel.subtitle, "Unknown")
        XCTAssertEqual(gameViewModel.releaseDateString, "Unknown")
        XCTAssertEqual(gameViewModel.userRatingString, "Unknown")
        XCTAssertEqual(gameViewModel.criticRatingString, "Unknown")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
