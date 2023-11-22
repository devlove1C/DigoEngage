//
//  LogEventApi.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

public class LogEventApiService: ApiService {
    public func logEventService(eventName: AppEvent, advertisingIdentifier: String, vendorIdentifier: String, contactId: String) async throws -> LogEventResponse {
        let deviceInfo = DeviceAttributes()
        let requestBody = EventRequestBody(event_name: eventName.rawValue, vendor_identifier: vendorIdentifier, contact_id: contactId, user_attributes: UserDataManager.shared.userAttributes, device_attribute: deviceInfo)
        
        let request = EventRequest(eventRequestBody: requestBody)
        let response = try await networkService.fetchData(LogEventResponse.self, networkRequest: request)
                return response.jsonObject
    }
}
