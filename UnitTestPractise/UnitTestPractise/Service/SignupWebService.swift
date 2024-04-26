//
//  SignupWebService.swift
//  UnitTestPractise
//
//  Created by gihan chanaka on 2024-04-25.
//

import Foundation

class SignupWebService {

    private var urlSession: URLSession
    private var urlString : String

    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }

    func signup(with form: SignupFormRequestModal, completionHandler: @escaping(SignupResponseModal?, SignupErrors?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        request.httpBody = try? JSONEncoder().encode(form)

        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let signupResponseModal = try? JSONDecoder().decode(SignupResponseModal.self, from: data) {
                completionHandler(signupResponseModal, nil)
            } else {
                //Handle error here
                completionHandler(nil, SignupErrors.responseModalParsingError)
            }

        }

        dataTask.resume()

    }

}
