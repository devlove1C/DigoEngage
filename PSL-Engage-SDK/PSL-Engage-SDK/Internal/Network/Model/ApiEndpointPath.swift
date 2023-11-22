//
//  ApiEndpointPath.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

/// Action Api url path : `Enum` type
internal enum ApiEndpointPath {
    case eventTrack(deviceID: Int)
    case userDetails
    
    var path: String {
        switch self {
        case .eventTrack(let deviceID):
            return "/api/v3/accounts/\(deviceID)/devices"
        case .userDetails:
            return "/userDetails"
        }
    }
}
