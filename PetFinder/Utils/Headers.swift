//
//  RequestParameters.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import Foundation
import Alamofire

final class Headers {
    public static var shared = Headers()
    
    private init() {}
    private var accessToken: String {
        guard let encodedToken = KeychainHelper.shared.read(service: KeychainData.accessToken.rawValue,
                                                            account: KeychainData.oauthAccount.rawValue) else {
            return ""
        }
        return String(data: encodedToken, encoding: .utf8) ?? ""
    }
    
    func standardHeaders() -> HTTPHeaders {
        return [
            "Accept": "application/json",
            "Bearer": self.accessToken
        ]
    }
}

