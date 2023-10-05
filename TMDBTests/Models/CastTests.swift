//
//  CastTests.swift
//  TMDBTests
//
//  Created by Vinoth Vino on 05/10/23.
//

import XCTest
@testable import TMDB

final class CastTests: XCTestCase {
    func testCastResponse() throws {
        // Arrange & Act
        guard let path = Bundle(for: CastTests.self).path(forResource: "cast", ofType: "json") else { fatalError("Can't find the cast.json file") }
        
        let data = try Data(contentsOf: URL(filePath: path))
        let cast: Cast = try DataParser().parse(data: data)
        
        // Assert
        XCTAssertEqual(cast.id, 82732)
        XCTAssertEqual(cast.creditId, "5ffad8a5fcec2e003f1854d6")
        XCTAssertEqual(cast.name, "Mohanlal")
        XCTAssertEqual(cast.popularity, 18.218)
        XCTAssertEqual(cast.profilePath, "/wvoBULQimwguAGPOHZ8TDoy7jBJ.jpg")
        XCTAssertEqual(cast.id, 82732)
        
        XCTAssertNotNil(cast.profileURL)
    }
}
