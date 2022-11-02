//
//  FetchObjectService.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 02.11.2022.
//

import Foundation
import AlamofireImage


class FetchObjectService<T: Decodable> {
    private let url: String
    private let session = SessionManager.shared.currentSession()
    private let parameters: [String: String]
    
    init(url: String, parameters: [String: String]) {
        self.url = url
        self.parameters = parameters
    }
    
    func getObject(completion: @escaping (T?, CustomError?) -> Void) {
        let path = URL(string: self.url)!
        let headers = Headers.shared.standardHeaders()
        self.session.request(
            path,
            method: .get,
            parameters: self.parameters,
            headers: headers
         )
        .responseDecodable(of: T.self) { response in
            guard response.error == nil else {
                switch response.error?.responseCode {
                case 401, 403:
                    AuthManager.shared.fetchAccessToken { _ in }
                    completion(nil, CustomError.denied)
                default:
                    completion(nil, CustomError.genericError)
                }
                return
            }
            guard let responseData = response.value else {
                completion(nil, CustomError.parseError)
                return
            }
            completion(responseData, nil)
        }
    }
}
