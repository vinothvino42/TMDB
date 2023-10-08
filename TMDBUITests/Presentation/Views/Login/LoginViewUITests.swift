//
//  LoginViewUITests.swift
//  LoginViewUITests
//
//  Created by Vinoth Vino on 07/10/23.
//

import XCTest

final class LoginViewUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func test_LoginView_signInButton_shouldDisplayProgressIndicator() {
        // Given
        let usernameField = app.textFields["UsernameField"]
        let passwordField = app.secureTextFields["PasswordField"]

        // When
        usernameField.tap()
        usernameField.typeText("vinothvino42")
        passwordField.tap()
        passwordField.typeText("WrongPassword")

        let doneButton = app.buttons["done"]
        doneButton.tap()

        let signInButton = app.buttons["SubmitButton"]
        signInButton.tap()
        
        let progressIndicator = app.activityIndicators["SubmitProgressIndicator"]
        let loadingText = app.staticTexts["Loading"]
        
        // Then
        XCTAssertTrue(progressIndicator.exists)
        XCTAssertTrue(loadingText.exists)
    }

    func test_LoginView_signInButton_shouldSignIn() {
        // Given
        let usernameField = app.textFields["UsernameField"]
        let passwordField = app.secureTextFields["PasswordField"]

        // When
        usernameField.tap()
        usernameField.typeText("vinothvino42")
        passwordField.tap()
        passwordField.typeText("ValidPassword")

        let doneButton = app.buttons["done"]
        doneButton.tap()

        let signInButton = app.buttons["SubmitButton"]
        signInButton.tap()
        
        let delayExpectation = XCTestExpectation()
        delayExpectation.isInverted = true
        wait(for: [delayExpectation], timeout: 6)
        
        // Then
        let moviesTitle = app.navigationBars["Movies"]
        let isExists = moviesTitle.waitForExistence(timeout: 8)
        XCTAssertTrue(isExists)
    }
    
    func test_LoginView_signInButton_shouldNotSignIn() {
        // Given
        let usernameField = app.textFields["UsernameField"]
        let passwordField = app.secureTextFields["PasswordField"]

        // When
        usernameField.tap()
        usernameField.typeText("vinothvino42")
        passwordField.tap()
        passwordField.typeText("InvalidPassword")

        let doneButton = app.buttons["done"]
        doneButton.tap()

        let signInButton = app.buttons["SubmitButton"]
        signInButton.tap()
        
        let progressIndicator = app.activityIndicators["SubmitProgressIndicator"]
        XCTAssertTrue(progressIndicator.exists)
        
        let moviesTitle = app.navigationBars["Movies"]
        let isExists = moviesTitle.waitForExistence(timeout: 8)
        let errorAlert = app.alerts["Error"]
        
        // Then
        XCTAssertTrue(errorAlert.exists)
        XCTAssertFalse(moviesTitle.exists)
    }
    
    override func tearDownWithError() throws {
        
    }
}
