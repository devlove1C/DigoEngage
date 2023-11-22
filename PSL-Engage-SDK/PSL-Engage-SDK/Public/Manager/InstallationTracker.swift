//
//  InstallationTracker.swift
//  PSL-Engage-SDK
//
//  Created by dlovewanshi on 21/11/23.
//

import Foundation

public class InstallationTracker {
    
    public static let shared = InstallationTracker()
    private init() {}
    
    public func isFirstLaunchOrReinstall()  {
        let uniqueKey = "com.app.dev.SampleApp5" //TODO: Need to discuss
        
        if KeychainService.load(key: uniqueKey) == nil && DefaultManager.shared.string(key: uniqueKey) == nil {
            guard let uniqueIdentifier = UIDevice.current.identifierForVendor?.uuidString else {
                return
            }
            _ = KeychainService.save(key: uniqueKey, data: uniqueIdentifier)
            DefaultManager.shared.set(keyValue: uniqueIdentifier, forKey: uniqueKey)
            updateAppStatus(event: "INSTALL") //TODO: Update the log on server for installaion the App
        }else if KeychainService.load(key: uniqueKey) != nil && DefaultManager.shared.string(key: uniqueKey) == nil {
            guard let uniqueIdentifier = UIDevice.current.identifierForVendor?.uuidString else {
                return
            }
            DefaultManager.shared.set(keyValue: uniqueIdentifier, forKey: uniqueKey)
            updateAppStatus(event: "REINSTALL") //TODO: Update the log on server for Re-installaion the App
        }
    }
    
    func updateAppStatus(event: String) {
        Task {
            _ = try await SDKEventManager.shared.event.logEventService(eventName: event, advertisingIdentifier: "123256", vendorIdentifier: "vendror.com", contactId: "60109")
        }
    }
}
