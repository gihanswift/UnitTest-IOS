//
//  MockURLProtocol.swift
//  UnitTestPractise
//
//  Created by gihan chanaka on 2024-04-25.
//

import Foundation

class MockURLProtocol: URLProtocol {

    static var stubResponseData: Data?
    static var shouldReturnError = false
    static var error: Error?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if MockURLProtocol.shouldReturnError {
            self.client?.urlProtocol(self, didFailWithError: MockURLProtocol.error ?? URLError(.cancelled))
        }
        self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        self.client?.urlProtocolDidFinishLoading(self)
    }

    

    override func stopLoading() { }
}
