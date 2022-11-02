//
//  AuthManager.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import Foundation
import Alamofire

final class AuthManager {
    
    static let shared = AuthManager()
    private let session = SessionManager.shared.currentSession()
    private init() {}
    
    func fetchAccessToken(completion: @escaping (CustomError?) -> Void) {
        let headers = Headers.shared.fetchBearerHeaders()
        let parameters = OAuthParameters.shared.getOAuthParameters()
        self.session.request(
            OAuthData.oauthURL.rawValue,
            method: .post,
            parameters: parameters,
            headers: headers
        )
        .responseDecodable(of: OAuthResponse.self) { response in
            guard let token = response.value,
                  let data = token.access_token.data(using: .utf8) else {
                completion(CustomError.fetchError)
                return
            }
            KeychainHelper.shared.save(
                data,
                service: KeychainData.accessToken.rawValue,
                account: KeychainData.oauthAccount.rawValue
            )
            completion(nil)
        }
    }
    
    func getStoredAccessToken() -> String? {
        if let bearer = KeychainHelper.shared.read(
            service: KeychainData.accessToken.rawValue,
            account: KeychainData.oauthAccount.rawValue
        )
        {
            return String(data: bearer, encoding: .utf8)
        } else {
            return nil
        }
    }
}
