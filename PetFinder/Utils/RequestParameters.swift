//
//  RequestParameters.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import Foundation
let headers: HTTPHeaders = [
    "Accept": "application/json",
    "Bearer": KeychainHelper.shared.read(service: KeychainData.accessToken.rawValue,
                                         account: KeychainData.oauthAccount.rawValue)
]
