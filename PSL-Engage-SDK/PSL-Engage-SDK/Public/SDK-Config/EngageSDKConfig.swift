//
//  PSLEngageConfig.swift
//  PSL-Engage-SDK
//
//  Created by dlovewanshi on 07/11/23.
//

import Foundation
public struct EngageSDKConfig {
    public let appId: String
    public let dataCenter: String
    
    public init(appId: String, dataCenter: String) {
        self.appId = appId
        self.dataCenter = dataCenter
        validateApiKey(appId: self.appId)
    }
    
    func validateApiKey(appId: String) {
        let isValid = true
        if isValid {
            // App-id key is valid, proceed with initialization
            print("App-id is valid. Initializing SDK...")
            // Perform any other initialization steps here
            // 
        } else {
            // API key is not valid, handle accordingly
            print("App-id is not valid. SDK initialization failed.")
        }
        // Should be called a API
        // Make a network request to your server to validate the app-id key
    }
}
