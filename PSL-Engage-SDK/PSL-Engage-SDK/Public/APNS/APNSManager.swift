//
//  PushNotificationManager.swift
//  PSL-Engage-SDK
//
//  Created by dlovewanshi on 06/11/23.
//

import Foundation
public class APNSManager {
    public static let shared = APNSManager()

    private let apns_service = APNSApiService()

    public func registerDeviceTokenWithEngage(token: String) {
        // Logic to validate the token inside the SDK
        apns_service.registerDeviceToken(token: token)
    }
}
