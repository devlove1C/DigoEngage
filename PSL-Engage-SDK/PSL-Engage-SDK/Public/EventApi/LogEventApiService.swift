//
//  LogEventApi.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

public class LogEventApiService: ApiService {
 // Log Event Service
// http://jsonplaceholder.typicode.com/posts?userId=
    public func logEventService(userId: String) async throws -> LogEventResponse {
        let requestBody = EventRequestBody(userId: userId)
        let request = EventRequest(userId: userId, eventRequestBody: requestBody)
        print("Request :- \(request)")
        let response = try await networkService.fetchData(LogEventResponse.self, networkRequest: request)
        print("Response is :- \(response)")
        return response.jsonObject
    }
}
