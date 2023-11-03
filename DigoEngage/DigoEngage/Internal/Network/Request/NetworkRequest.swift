//
//  EndPoint.swift
//  DigoEngage
//
//  Created by dlovewanshi on 12/10/23.
//

import Foundation

/// Headers
internal typealias Headers = [String: String]

/// Network request protocal
internal protocol NetworkRequest {
    associatedtype T: Codable
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var queryParameters: [String: String]? { get }
    var body: T? { get }
    var headers: Headers? { get }
    
    func urlRequest() throws -> URLRequest
}

/// Http Method
internal enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
