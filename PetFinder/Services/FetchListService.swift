//
//  FetchListService.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import Foundation
import Alamofire

class FetchListService<T: Decodable> {
    
    private let url: String
    private let session = SessionManager.shared.currentSession()
    
    init(url: String) {
        self.url = url
    }
    
    func getList(parameters: [String: String]? = nil, completion: @escaping (T?, CustomError?) -> Void) {
        let path = URL(string: self.url)!
        let headers = Headers.shared.standardHeaders()
        self.session.request(
            path,
            method: .get,
            parameters: parameters,
            headers: headers)
        .responseDecodable(of: T.self) { response in
            guard let responseData = response.value else {
                if let data = response.data,
                   let baseResponse = try? JSONDecoder().decode(BaseResponse.self, from: data) {
                    switch baseResponse.status {
                    case 401, 403:
                        AuthManager.shared.fetchAccessToken { _ in }
                        completion(nil, CustomError.denied)
                    default:
                        AuthManager.shared.fetchAccessToken { _ in }
                        completion(nil, CustomError.genericError)
                    }
                }
                completion(nil, CustomError.genericError)
                return
            }
            completion(responseData, nil)
        }
    }
}
