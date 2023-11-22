//
//  LogEventResponse.swift
//  DigoEngage
//
//  Created by dlovewanshi on 16/10/23.
//

import Foundation
public struct LogEventResponse : Decodable {
    let id: Int
    let eventName, advertisingIdentifier, vendorIdentifier, osVersion: String
    let deviceTimezone, name, deviceModel, platform: String
    let userAttributes: UserAttributes
    let contactID, accountID: Int
    let createdAt, updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case eventName = "event_name"
        case advertisingIdentifier = "advertising_identifier"
        case vendorIdentifier = "vendor_identifier"
        case osVersion = "os_version"
        case deviceTimezone = "device_timezone"
        case name
        case deviceModel = "device_model"
        case platform
        case userAttributes = "user_attributes"
        case contactID = "contact_id"
        case accountID = "account_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}



