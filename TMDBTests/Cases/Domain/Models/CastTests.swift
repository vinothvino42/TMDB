//
//  CastTests.swift
//  TMDBTests
//
//  Created by Vinoth Vino on 05/10/23.
//

import XCTest
@testable import TMDB

final class CastTests: XCTestCase {
    var cast: Cast!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        cast = try DataLoader().loadFile(withFileName: "cast")
    }
    
    func testModel_createsCast() {
        XCTAssertNotNil(cast, "The cast should not be nil")
        
        XCTAssertEqual(cast.id, 82732)
        XCTAssertEqual(cast.id, 82732)
        XCTAssertEqual(cast.creditId, "5ffad8a5fcec2e003f1854d6")
        XCTAssertEqual(cast.name, "Mohanlal")
        XCTAssertEqual(cast.popularity, 18.218)
        XCTAssertEqual(cast.profilePath, "/wvoBULQimwguAGPOHZ8TDoy7jBJ.jpg")
        XCTAssertEqual(cast.id, 82732)
        
        XCTAssertNotNil(cast.profileURL)
    }
    
    override func tearDownWithError() throws {
        cast = nil
        try super.tearDownWithError()
    }
}
