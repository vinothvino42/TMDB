//
//  MovieTests.swift
//  TMDBTests
//
//  Created by Vinoth Vino on 05/10/23.
//

import XCTest
@testable import TMDB

final class MovieTests: XCTestCase {
    var movie: Movie!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        movie = try DataLoader().loadFile(withFileName: "movie")
    }
    
    func testModel_createsMovie() throws {
        XCTAssertNotNil(movie, "The movie should not be nil")
        
        XCTAssertEqual(movie.id, 346698)
        XCTAssertEqual(movie.title, "Barbie")
        XCTAssertEqual(movie.overview, "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.")
        XCTAssertEqual(movie.backdropPath, "/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg")
        XCTAssertEqual(movie.posterPath, "/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg")
        XCTAssertEqual(movie.voteAverage, 7.267)
        XCTAssertEqual(movie.runtime, 114)
        XCTAssertEqual(movie.releaseDate, "2023-07-19")
        XCTAssertEqual(movie.genres?.count, 3)
    }
    
    func testModel_whenInitialized_hasVideo() {
        XCTAssertFalse(movie.hasVideo)
    }
    
    func testModel_whenInitialized_urlParsed() {
        XCTAssertNotNil(movie.posterURL)
        XCTAssertNotNil(movie.backdropURL)
    }
    
    func testModel_whenInitialized_ratingFormattedText() {
        XCTAssertEqual(movie.ratingText, "7.3 / 10")
    }
    
    func testModel_whenInitialized_genreFormattedText() {
        XCTAssertEqual(movie.genreText, "Comedy | Adventure | Fantasy")
    }
    
    func testModel_whenInitialized_durationFormattedText() {
        XCTAssertEqual(movie.durationText, "1 hour, 54 minutes")
    }
    
    override func tearDownWithError() throws {
        movie = nil
        try super.tearDownWithError()
    }
}
