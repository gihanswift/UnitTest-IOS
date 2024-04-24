//
//  SignupFormModalValidator.swift
//  UnitTestPractiseTests
//
//  Created by gihan chanaka on 2024-04-24.
//

import XCTest
@testable import UnitTestPractise

final class SignupFormModalValidatorTests: XCTestCase {

    var sut: SignupFormModalValidator!

    override func setUp() {

        sut = SignupFormModalValidator()
    }

    override func tearDown() {
        sut = nil
    }


    func testSignupModalValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {

        //Arrage

        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Gihan")

        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should return TRUE for a valid first name, But return FALSE")
    }

    func testSignupModalValidator_WhenTooShortNameProvided_ShouldReturnFalse() {
        //Arrage

        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "s")

        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should return FALSE for valid first Name.First Name should be greater than \(SignupConstants.firstNameMinLength) characters But return TRUE")
    }

    func testSignupModalValidator_WhenLongFirstNameProvided_ShouldReturnFalse() {

        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "GihanChanakaGihan")

        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should return false for valid first name, First name should be less than \(SignupConstants.firstNameMaxLength) characters, But return TRUE")

    }

    func testSignupValidator_WhenLastNameTooShortProvided_ShouldReturnFalse() {
        

        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: "s")

        //Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should return FALSE for valid last name, Last Name should be less than \(SignupConstants.lastNameMinLength) But return TRUE")

    }

    func testSignupValidator_WhenLastNameTooLongProvided_ShouldReturnFalse() {

        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: "GihanChanakaChanakaGihanGihan")

        //Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() Should return FALSE, Last Name should be less than \(SignupConstants.lastNameMaxLength) But Return TRUE")
    }

    func testSignupValidator_WhenPasswordAndRepeatPasswordProvided_ShouldReturnTrue() {
        
        //Act
        let isBothPasswordCorrect = sut.isMatchPasswordAndRepeatPassword(password: "1234", repeatPassword: "1234")
        
        //Assert
        XCTAssertTrue(isBothPasswordCorrect, "The isBothPasswordCorrect() should return TRUE")
    }

    func testSignupValidator_WhenPasswordAndRepeatPasswordDoNotMatch_ShouldReturnFalse() {

        //Act
        let isBothPasswordIncorrect = sut.isMatchPasswordAndRepeatPassword(password: "1234", repeatPassword: "12")

        //Assert
        XCTAssertFalse(isBothPasswordIncorrect, "isBothPasswordIncorrect() should return FALSE")

    }

}
