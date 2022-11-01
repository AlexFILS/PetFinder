//
//  Error+Extension.swift
//  PetFinder
//
//  Created by Alexandru Mihai on 31.10.2022.
//

enum CustomError: Error {
    case denied
    case fetchError
    case parseError
    case genericError
}

extension CustomError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .denied:
            return "Token invalid or missing."
        case .fetchError:
            return "Something went wrong with the request."
        case .parseError:
            return "Call succeeded but couldn't parse the response."
        case .genericError:
            return "Unknown error occured."
        }
    }
}
