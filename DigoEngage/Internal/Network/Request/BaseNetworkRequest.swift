//
//  BaseNetworkRequest.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

internal class BaseNetworkRequest<T: Codable>: NetworkRequest {
    var path: String
    
    var httpMethod: HTTPMethod
    
    var queryParameters: [String : String]?
    
    var body: T?
    
    var headers: Headers?
    
    var jsonEncoder = JsonFactory.shared.encoder
    
    init() {
        self.path = "nothing"
        self.httpMethod = .get
    }
    
    init(path: String, httpMethod: HTTPMethod, queryParameters: [String : String]? = nil, body: T? = nil, headers: Headers? = nil) {
        self.path = path
        self.httpMethod = httpMethod
        self.queryParameters = queryParameters
        self.body = body
        self.headers = headers
    }
    
    func setupHeaders() {
        // to be implemented by subclasses
    }
    
    func generateUrlComponents() throws -> URLComponents {
        /// Getting the base Url and preparing the `URLComponents` base on url path, and preparing the URL.
        guard let urlComponents = URLComponents(string: path) else {
            throw SDKError.failed(reason: "Failed to construct URLComponents.")
        }
        
        return urlComponents
    }
    
    func urlRequest() throws -> URLRequest {
        var urlComponents = try generateUrlComponents()
        
        setupHeaders()
        
        if let params = queryParameters, !params.isEmpty {
            urlComponents.queryItems = params.map{ (param) -> URLQueryItem in
                return URLQueryItem(name: param.key, value: param.value)
            }
        }
        
        guard let url = urlComponents.url else {
            throw SDKError.failed(reason: "Failed to get URL from urlComponents.")
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        /// If we have a request body, convert it to usable JSON for the network request.
        if let requestBody = body {
            // Convert model to JSON data
            guard let jsonData = try? jsonEncoder.encode(requestBody) else {
                throw SDKError.failed(reason: "Failed to encode request body.")
            }
            request.httpBody = jsonData
        }
        
        return request
    }
}
