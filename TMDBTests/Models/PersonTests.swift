//
//  PersonTests.swift
//  TMDBTests
//
//  Created by Vinoth Vino on 05/10/23.
//

import XCTest
@testable import TMDB

final class PersonTests: XCTestCase {
    func testPersonResponse() throws {
        // Arrange & Act
        guard let path = Bundle(for: PersonTests.self).path(forResource: "person", ofType: "json") else { fatalError("Can't find the person.json file") }
        
        let data = try Data(contentsOf: URL(filePath: path))
        let person: Person = try DataParser().parse(data: data)
        
        // Assert
        XCTAssertEqual(person.id, 1767250)
        XCTAssertEqual(person.name, "Ariana Greenblatt")
        XCTAssertEqual(person.knownForDepartment, "Acting")
        XCTAssertEqual(person.popularity, 73.395)
        XCTAssertEqual(person.profilePath, "/8xrCTYP8PuHixWzkiX6onJNfw8k.jpg")
        XCTAssertEqual(person.gender, 1)
        XCTAssertEqual(person.genderText, "Female")
        
        XCTAssertNotNil(person.profileURL)
    }
}
