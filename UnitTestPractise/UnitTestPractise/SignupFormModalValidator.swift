//
//  SignupFormModalValidator.swift
//  UnitTestPractise
//
//  Created by gihan chanaka on 2024-04-24.
//

import Foundation

class SignupFormModalValidator {

    func isFirstNameValid(firstName: String) -> Bool {
        var valid = true

        if  firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            valid = false
        }

        return valid

    }

    func isLastNameValid(lastName: String) -> Bool {
        var valid = true

        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > 15 {
            valid = false
        }

        return valid
    }

    func isMatchPasswordAndRepeatPassword(password: String, repeatPassword: String) -> Bool {
        var matchBoth = true

        if password != repeatPassword {
            matchBoth = false
        }

        return matchBoth
    }

}
