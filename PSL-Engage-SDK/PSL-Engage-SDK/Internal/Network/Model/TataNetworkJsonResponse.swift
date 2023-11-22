//
//  TataNetworkJsonResponse.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

internal struct TataNetworkJsonResponse<T: Decodable> {
    let jsonObject: T
    let httpResponse: URLResponse
    
    init(_ networkResponse: (T, URLResponse)) {
        self.jsonObject = networkResponse.0
        self.httpResponse = networkResponse.1
    }
}
