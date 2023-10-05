//
//  MovieTests.swift
//  TMDBTests
//
//  Created by Vinoth Vino on 05/10/23.
//

import XCTest
@testable import TMDB

final class MovieTests: XCTestCase {
    func testMovieResponse() throws {
        // Arrange & Act
        guard let path = Bundle(for: MovieTests.self).path(forResource: "movie", ofType: "json") else { fatalError("Can't find the movie.json file") }
        
        let data = try Data(contentsOf: URL(filePath: path))
        let movie: Movie = try DataParser().parse(data: data)
        
        // Assert
        XCTAssertEqual(movie.id, 346698)
        XCTAssertEqual(movie.title, "Barbie")
        XCTAssertEqual(movie.overview, "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.")
        XCTAssertEqual(movie.backdropPath, "/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg")
        XCTAssertEqual(movie.posterPath, "/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg")
        XCTAssertEqual(movie.voteAverage, 7.267)
        XCTAssertEqual(movie.runtime, 114)
        XCTAssertEqual(movie.releaseDate, "2023-07-19")
        XCTAssertEqual(movie.genres?.count, 3)
        
        XCTAssertFalse(movie.hasVideo)
        
        XCTAssertNotNil(movie.posterURL)
        XCTAssertNotNil(movie.backdropURL)
        
        XCTAssertEqual(movie.ratingText, "7.3 / 10")
        XCTAssertEqual(movie.genreText, "Comedy | Adventure | Fantasy")
        XCTAssertEqual(movie.durationText, "1 hour, 54 minutes")
    }
}
