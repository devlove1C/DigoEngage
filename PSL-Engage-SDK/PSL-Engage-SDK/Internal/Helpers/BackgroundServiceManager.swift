//
//  BackgroundService.swift
//  PSL-Engage-SDK
//
//  Created by dlovewanshi on 24/11/23.
//

import Foundation

import UIKit

class BackgroundServiceManager {
 static let shared = BackgroundServiceManager()
 
    /// Register Notification for back ground Event `MOE_APP_EXIT`
     init(){
        debugPrint("Background Services Iniliaze")
        registerForBackgroundNotification()
    }
    
    private func registerForBackgroundNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackgtound), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    @objc private func appDidEnterBackgtound() {
        debugPrint("Application Enter in Background")
        //TODO: Will replace advertisingIdentifier, vendorIdentifier, and contactId
        Task(priority: .background) {
            _ = try await SDKEventManager.shared.event.logEventService(eventName: AppEvent.moeAppExit, advertisingIdentifier: "123256", vendorIdentifier: "vendror.com", contactId: "60109")
        }
    }
}
