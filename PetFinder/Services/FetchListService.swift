//
//  FetchListService.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import Foundation
import Alamofire

class FetchListService<T: Decodable> {
    let url: String
    private let session = SessionManager.shared.currentSession()
    
    init(url: String) {
        self.url = url
    }
    
    func getList(completion: @escaping (T?, Error?) -> Void) {
        let path = URL(string: self.url)!
        let headers = Headers.shared.standardHeaders()
        self.session.request(
            path,
            method: .get,
            headers: headers)
        .responseDecodable(of: T.self) { response in
            guard response.error == nil else {
                switch response.error?.responseCode {
                case 401, 403:
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
