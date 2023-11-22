//
//  TataSDKInitializer.swift
//  PSL-Engage-SDK
//
//  Created by dlovewanshi on 06/11/23.
//

import Foundation

public class TataSDKInitializer {
    private var appID: String? = "@Abc@Xyz123"

    private init() {}

    public func initialize(withAppID appID: String) {
        self.appID = appID
    }

    public func performAPIRequest() {
        guard let appID = appID else {
            fatalError("SDK not initialized with app ID")
        }
        // Perform the API request with the appID
    }
}
