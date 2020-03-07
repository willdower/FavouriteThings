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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVideoGame() {
        //This function tests all objects are assigned properly during VideoGame init()
        let title = "Minecraft"
        let imageName = "minecraftArt"
        let developer = "Mojang"
        let releaseYear = 2009
        let releaseMonth = 5
        let releaseDay = 17
        let userRating: Float = 7.7
        let criticRating = 93
        
        var dc = DateComponents()
        dc.year = releaseYear
        dc.month = releaseMonth
        dc.day = releaseDay
        
        let releaseDate = Calendar.current.date(from: dc)
        
        let game = VideoGame(title: title, imageName: imageName, developer: developer, releaseYear: releaseYear, releaseMonth: releaseMonth, releaseDay: releaseDay, userRating: userRating, criticRating: criticRating)
        
        XCTAssertEqual(game.title, title)
        XCTAssertEqual(game.boxArt, Image(imageName))
        XCTAssertEqual(game.developer, developer)
        XCTAssertEqual(game.releaseDate, releaseDate)
        XCTAssertEqual(game.userRating, userRating)
        XCTAssertEqual(game.criticRating, criticRating)
    }
    
    func testNilValues() {
        let title = "Minecraft"
        let imageName: String? = nil
        let developer: String? = nil
        let releaseYear: Int? = nil
        let releaseMonth: Int? = nil
        let releaseDay: Int? = nil
        let userRating: Float? = nil
        let criticRating: Int? = nil
        
        let game = VideoGame(title: title, imageName: imageName, developer: developer, releaseYear: releaseYear, releaseMonth: releaseMonth, releaseDay: releaseDay, userRating: userRating, criticRating: criticRating)
        
        XCTAssertEqual(game.boxArt, Image("placeholderArt"))
        
        //No other tests necessary, as nils handled on view level
        //If test successfully completes, nils handled properly
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
