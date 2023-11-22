//
//  DeviceAttributes.swift
//  PSL-Engage-SDK
//
//  Created by dlovewanshi on 20/11/23.
//

import Foundation
import AdSupport
struct DeviceAttributes {
    let identifier: String
    let model: String
    let name: String
    let timeZone: String
    let osVersion: String
    
    init() {
        // Get the advertisement identifier
        print("Ad support identifier is :- ")
        print(ASIdentifierManager.shared().advertisingIdentifier)
        if let identifier = UIDevice.current.identifierForVendor?.uuidString {
            self.identifier = identifier //TODO: will work on this part
        } else {
            self.identifier = "N/A"
        }
        
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


