//
//  AuthManager.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import Foundation
import Alamofire

final class AuthManager {
    
    func fetchAccessToken(completion: @escaping (Error?) -> Void) {
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        let parameters = OAuthParameters.shared.getOAuthParameters()
        SessionManager.shared.currentSession().request(
            OAuthData.oauthURL.rawValue,
            method: .post,
            parameters: parameters,
            headers: headers)
        .responseDecodable(of: OAuthResponse.self) { response in
            guard let token = response.value,
            let data = token.access_token.data(using: .utf8) else {
                completion(CustomError.fetchError)
                return
            }
            KeychainHelper.shared.save(data,
                                         service: KeychainData.accessToken.rawValue,
                                         account: KeychainData.oauthAccount.rawValue)
            completion(nil)
        }
    }
}
