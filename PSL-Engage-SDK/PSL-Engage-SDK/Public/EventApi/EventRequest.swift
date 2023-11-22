//
//  EventRequest.swift
//  DigoEngage
//
//  Created by dlovewanshi on 16/10/23.
//

import Foundation
internal class EventRequest:TataNetworkRequest<EventRequestBody> {
    init(eventRequestBody: EventRequestBody) {
        super.init(path: ApiEndpointPath.eventTrack(deviceID: 1).path, httpMethod: .post, body: eventRequestBody)
    }
}
