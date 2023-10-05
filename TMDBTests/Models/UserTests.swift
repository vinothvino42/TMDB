//
//  UserTests.swift
//  TMDBTests
//
//  Created by Vinoth Vino on 05/10/23.
//

import XCTest
@testable import TMDB

final class UserTests: XCTestCase {
    func testUserResponse() throws {
        // Arrange & Act
        guard let path = Bundle(for: UserTests.self).path(forResource: "user", ofType: "json") else { fatalError("Can't find the user.json file") }
        
        let data = try Data(contentsOf: URL(filePath: path))
        let user: User = try DataParser().parse(data: data)
        
        // Assert
        XCTAssertEqual(user.id, 123)
        XCTAssertEqual(user.name, "Vinoth Vino")
        XCTAssertEqual(user.username, "vinothvino42")
        XCTAssertEqual(user.image, "/asdfurl.png")
        
        XCTAssertNotNil(user.imageURL)
    }
}
