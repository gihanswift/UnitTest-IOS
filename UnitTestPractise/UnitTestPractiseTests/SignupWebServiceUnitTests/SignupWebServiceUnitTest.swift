//
//  SignupWebServiceUnitTest.swift
//  UnitTestPractiseTests
//
//  Created by gihan chanaka on 2024-04-25.
//

import XCTest
@testable import UnitTestPractise

final class SignupWebServiceUnitTest: XCTestCase {

    //    var sut: SignupWebService!
    //    var signupFormRequestModal : SignupFormRequestModal!

    override func setUp() {
        //        sut = SignupWebService(urlString: "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users")

    }

    override func tearDown() {
        //        sut = nil

    }

    func testSignupWebService_WhenGivenSuccessFullResponse_ReturnSuccess() {

        //A configuration object that defines behavior and policies for a URL session.
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)

        let jsonString = "{\"status\":\"ok\"}"

        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)

        let sut = SignupWebService(urlString: SignupConstants.signupURL, urlSession: urlSession)

        //Arrange

        let signupFormRequestModal = SignupFormRequestModal(firstName: "Gihan", lastName: "chanaka", email: "gihanswift@gmail.com", password: "1234")

        let expectation = self.expectation(description: "Signup web service response expectation")


        //Act
        sut.signup(with: signupFormRequestModal) {[weak self] signupResponseModal, error in
            guard let _ = self else { return }

            //Assert
            MockURLProtocol.shouldReturnError = true
            MockURLProtocol.error = error
            XCTAssertEqual(signupResponseModal?.status, "ok")
            expectation.fulfill()

        }

        self.wait(for: [expectation], timeout: 5)


    }

    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData =  jsonString.data(using: .utf8)
        let urlSession = URLSession(configuration: config)
        let sut = SignupWebService(urlString: SignupConstants.signupURL, urlSession: urlSession)
        let signupFormRequestModal = SignupFormRequestModal(firstName: "Gihan", lastName: "chanaka", email: "gihanswift@gmail.com", password: "1234")

        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")

        // Act
        sut.signup(with: signupFormRequestModal) { (signupResponseModel, error) in

            // Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupErrors.responseModalParsingError, "The signup() method did not return expected error")
            expectation.fulfill()

        }

        self.wait(for: [expectation], timeout: 5)
    }



}
