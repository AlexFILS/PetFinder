//
//  SessionManager.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

import Foundation
import Alamofire

final class SessionManager {
    
    public static var shared = SessionManager()
    
    private init() {}
    
    public func currentSession() -> Session {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 60
        return Session(configuration: configuration)
    }
}
