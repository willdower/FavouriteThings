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
    private var imageURL: String!
    private var developer: String!
    private var releaseDate: String!
    private var userRating: Double!
    private var criticRating: Int!
    private var game: VideoGame!
    private var gameViewModel: GameDetailViewModel!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.title = "Minecraft"
        self.imageURL = "https://i.imgur.com/hDE2TIm.jpg"
        self.developer = "Mojang"
        self.releaseDate = "17/5/2009"
        self.userRating = 7.7
        self.criticRating = 93
        
        self.game = VideoGame(title: title, imageURL: imageURL, developer: developer, releaseDate: releaseDate, userRating: userRating, criticRating: criticRating)
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
        //This function tests the image is loaded from the internet correctly
        XCTAssertNotNil(game.boxArt) //Need to add resizable in assertion too
    }
    
    func testDeveloper() {
        //This function tests the developer is assigned properly during VideoGame init()
        XCTAssertEqual(game.developer, developer)
    }
    
    func testReleaseDate() {
        //This function tests the release date is assigned properly during VideoGame init() and is properly generated from its components
        
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
    
    func testViewModel() {
        var viewModel = GamesViewModel()
        viewModel.addGame(game)
        viewModel.addGame(VideoGame(title: "Steep", imageURL: "https://i.imgur.com/Jnt4nOs.jpg", developer: "Ubisoft", releaseDate: "2016/12/2", userRating: 6.8, criticRating: 72))
        
        XCTAssertEqual(viewModel.games.count, 6) //Default 4 plus 2 added above
        XCTAssertEqual(viewModel.games[0].title, "Minecraft")
        XCTAssertEqual(viewModel.games[1].title, "Steep")
        XCTAssertEqual(viewModel.viewModels[0].title, "Minecraft")
        XCTAssertEqual(viewModel.viewModels[1].title, "Steep")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
