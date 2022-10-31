//
//  FetchListService.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import Foundation
import Alamofire

class FetchListService<T: Decodable> {
    
    func getList(endpoint url: String, completion: @escaping ([T]?, Error?) -> Void) {
        let path = URL(string: url)!
        let headers = Headers.shared.standardHeaders()
        SessionManager.shared.currentSession().request(
            path,
            method: .post,
            headers: headers)
        .responseDecodable(of: [T].self) { response in
            guard response.error != nil else {
                switch response.error?.responseCode {
                case 403:
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
