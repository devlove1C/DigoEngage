//
//  DeviceAttributes.swift
//  PSL-Engage-SDK
//
//  Created by dlovewanshi on 20/11/23.
//

import Foundation
import AdSupport
struct DeviceAttributes {
    static var identifier: String?
    let model: String
    let name: String
    let timeZone: String
    let osVersion: String
    
    init() {
        // Get the advertisement identifier
        Self.identifier = DeviceAttributes.identifier ?? "DefaultIdentifier" //DeviceInformationManager.shared.getAdvertisementIdentifier()  //TODO: will work on this part
        // Get the device model
        self.model = UIDevice.current.model
        
        // Get the device name
        self.name = UIDevice.current.name
        
        // Get the device time zone
        self.timeZone = TimeZone.current.identifier
        
        // Get the device OS version
        self.osVersion = UIDevice.current.systemVersion
    }
}


