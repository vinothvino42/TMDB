//
//  PersonTests.swift
//  TMDBTests
//
//  Created by Vinoth Vino on 05/10/23.
//

import XCTest
@testable import TMDB

final class PersonTests: XCTestCase {
    var person: Person!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        person = try DataLoader().loadFile(withFileName: "person")
    }
    
    func testModel_createsPerson() throws {
        XCTAssertNotNil(person, "The person should not be nil")
        
        XCTAssertEqual(person.id, 1767250)
        XCTAssertEqual(person.name, "Ariana Greenblatt")
        XCTAssertEqual(person.knownForDepartment, "Acting")
        XCTAssertEqual(person.popularity, 73.395)
        XCTAssertEqual(person.profilePath, "/8xrCTYP8PuHixWzkiX6onJNfw8k.jpg")
        XCTAssertEqual(person.gender, 1)
        XCTAssertEqual(person.genderText, "Female")
        
        XCTAssertNotNil(person.profileURL)
    }
    
    override func tearDownWithError() throws {
        person = nil
        try super.tearDownWithError()
    }
}
