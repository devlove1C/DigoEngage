//
//  EventRequest.swift
//  DigoEngage
//
//  Created by dlovewanshi on 16/10/23.
//

import Foundation
internal class EventRequest:TataNetworkRequest<EventRequestBody> {
     init(userId: String, eventRequestBody: EventRequestBody) {
         super.init(path: ApiEndpointPath.userDetails.rawValue, httpMethod: .get, queryParameters: ["userId": eventRequestBody.userId])
    }
}
