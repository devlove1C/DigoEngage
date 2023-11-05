//
//  NetworkService.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

internal struct NetworkService: NetworkProtocol {
 
    public func fetchData(networkRequest: any NetworkRequest, urlSession: URLSession = URLSessionFactory.shared.defaultSession) async throws -> NetworkDataResponse {
        
        do {
            let request = try networkRequest.urlRequest()

            return NetworkDataResponse(try await urlSession.data(for: request))
        } catch let error as SDKError {
            throw error
        } catch {
            throw SDKError.unknown(error)
        }
    }

}
