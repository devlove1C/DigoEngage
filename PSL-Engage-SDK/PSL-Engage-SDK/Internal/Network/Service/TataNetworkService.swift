//
//  TataNetworkService.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

internal class TataNetworkService {
    /// Shared reference
    static let shared = TataNetworkService()
    
    /// Json decoder
    private let decoder = JsonFactory.shared.decoder
    
    internal var networking: NetworkProtocol

    /// To access anything need to use `shared`
    private init() {
        self.networking = NetworkService()
    }
    
    internal init(networking: NetworkProtocol) {
        self.networking = networking
    }
    
    func fetchData<T: Decodable>(_ type: T.Type, networkRequest: any NetworkRequest, urlSession: URLSession = URLSessionFactory.shared.defaultSession) async throws -> TataNetworkJsonResponse<T> {
        do {
            let response = try await networking.fetchData(networkRequest: networkRequest, urlSession: urlSession)
            if let httpResponse = response.urlResponse as? HTTPURLResponse, let error = getHttpError(httpResponse) {
                throw error
            }
            let result = try parseJsonResponse(data: response.data, as: type)
            
            do {
                let responseObject = try JSONSerialization.jsonObject(with:response.data, options: .mutableLeaves)
                print("Response Object is \(responseObject)")
            } catch let myJSONError {
                print(myJSONError)
            }
            
            return TataNetworkJsonResponse((result, response.urlResponse))
        } catch let error as SDKError {
            throw error
        } catch {
            throw SDKError.networkError(error)
        }
    }
    
    func fetchEmptyData<T: Decodable>(_ type: T.Type, networkRequest: any NetworkRequest, urlSession: URLSession = URLSessionFactory.shared.defaultSession) async throws -> TataNetworkJsonResponse<T?> {
        do {
            let response = try await networking.fetchData(networkRequest: networkRequest, urlSession: urlSession)
            if let httpResponse = response.urlResponse as? HTTPURLResponse, let error = getHttpError(httpResponse) {
                throw error
            }
            
            let result: T?
            if !response.data.isEmpty {
                result = try parseJsonResponse(data: response.data, as: type)
            } else {
                result = nil
            }
            
            return TataNetworkJsonResponse((result, response.urlResponse))
        } catch let error as SDKError {
            throw error
        } catch {
            throw SDKError.networkError(error)
        }
    }

  
    private func parseJsonResponse<T: Decodable>(data: Data, as type: T.Type) throws -> T {
        do {
            // Attempt to decode & return the result.
            let result = try self.decoder.decode(type, from: data)
            print("Response is :- \(result)")
            return result
        } catch {
            throw SDKError.badServerResponse(error)
        }
    }

    func getHttpError(_ response: HTTPURLResponse) -> SDKError? {
        let statusCode = response.statusCode
        
        switch statusCode {
        case 200:
            return nil
        case 400:
            return .badRequest
        case 500:
            return .serviceError
        default:
            return .unexpectedNetworkError(statusCode)
        }
    }
}
