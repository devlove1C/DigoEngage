//
//  EventBody.swift
//  DigoEngage
//
//  Created by dlovewanshi on 16/10/23.
//

import Foundation

internal struct EventRequestBody : Codable {
    let event_name: String
    let advertising_identifier: String
    let vendor_identifier: String
    let os_version: String
    let device_timezone: String
    let name: String  //TODO: - Specific Device Model Name eg:iPhone 7",iPhone X"
    let device_model: String //TODO: -Device model type eg:iPhone"/"iPad"
    let platform: String
    let contact_id: String
    let user_attributes: UserAttributes

    enum CodingKeys: String, CodingKey {
        case event_name
        case advertising_identifier
        case vendor_identifier
        case os_version
        case device_timezone
        case name
        case device_model
        case platform
        case contact_id
        case user_attributes
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        event_name = try values.decode(String.self, forKey: .event_name)
        advertising_identifier = try values.decode(String.self, forKey: .advertising_identifier)
        vendor_identifier = try values.decode(String.self, forKey: .vendor_identifier)
        os_version = try values.decode(String.self, forKey: .os_version)
        device_timezone = try values.decode(String.self, forKey: .device_timezone)
        name = try values.decode(String.self, forKey: .name)
        device_model = try values.decode(String.self, forKey: .device_model)
        platform = try values.decode(String.self, forKey: .platform)
        contact_id = try values.decode(String.self, forKey: .contact_id)
        user_attributes = try values.decode(UserAttributes.self, forKey: .user_attributes)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(event_name, forKey: .event_name)
        try container.encode(advertising_identifier, forKey: .advertising_identifier)
        try container.encode(vendor_identifier, forKey: .vendor_identifier)
        try container.encode(os_version, forKey: .os_version)
        try container.encode(device_model, forKey: .device_model)
        try container.encode(name, forKey: .name)
        try container.encode(device_timezone, forKey: .device_timezone)
        try container.encode(platform, forKey: .platform)
        try container.encode(contact_id, forKey: .contact_id)
        try container.encode(user_attributes, forKey: .user_attributes)
        
    }
    
    init(event_name: String, vendor_identifier: String, contact_id: String, user_attributes: UserAttributes, device_attribute: DeviceAttributes) {
        self.advertising_identifier = device_attribute.identifier
        self.os_version = device_attribute.osVersion
        self.device_model = device_attribute.model
        self.name = device_attribute.name
        self.device_timezone = device_attribute.timeZone
        self.event_name = event_name
        self.vendor_identifier = vendor_identifier
        self.platform = "iOS" //TODO: - Will fetch this value from constant
        self.contact_id = contact_id
        self.user_attributes = user_attributes
    }
}

