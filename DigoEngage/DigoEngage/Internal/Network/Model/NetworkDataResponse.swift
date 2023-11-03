//
//  NetworkDataResponse.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

internal struct NetworkDataResponse {
    let data: Data
    let urlResponse: URLResponse
    
    init(_ dataSessionResponse: (Data, URLResponse)) {
        self.data = dataSessionResponse.0
        self.urlResponse = dataSessionResponse.1
    }
}
