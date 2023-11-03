//
//  Network.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

internal protocol NetworkProtocol {
    func fetchData(networkRequest: any NetworkRequest, urlSession: URLSession) async throws -> NetworkDataResponse
}
