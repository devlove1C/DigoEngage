//
//  LogEventApi.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

public class LogEventApiService: ApiService {
 // Log Event Service
    public func logEventService(eventName: String, advertisingIdentifier: String, vendorIdentifier: String, contactId: String) async throws -> LogEventResponse {
        let deviceInfo = DeviceAttributes()
//        print("Identifier: \(deviceInfo.identifier)")
//        print("Model: \(deviceInfo.model)")
//        print("Name: \(deviceInfo.name)")
//        print("Time Zone: \(deviceInfo.timeZone)")
//        print("OS Version: \(deviceInfo.osVersion)")
        let requestBody = EventRequestBody(event_name: eventName, vendor_identifier: vendorIdentifier, contact_id: contactId, user_attributes: UserDataManager.shared.userAttributes, device_attribute: deviceInfo)
        
        let request = EventRequest(eventRequestBody: requestBody)
        let response = try await networkService.fetchData(LogEventResponse.self, networkRequest: request)
                return response.jsonObject
    }
}
